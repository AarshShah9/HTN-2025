@component
export class AsrBasic extends BaseScriptComponent {
    private asrModule = require('LensStudio:AsrModule');

    @input internetModule: InternetModule; // Drag InternetModule asset here in Lens Studio

    onAwake(): void {
        const options = AsrModule.AsrTranscriptionOptions.create();
        options.silenceUntilTerminationMs = 1000;
        options.mode = AsrModule.AsrMode.HighAccuracy;

        // Handle transcription results
        options.onTranscriptionUpdateEvent.add((eventArgs) => {
            if (eventArgs.isFinal) {
                const text = eventArgs.text.toLowerCase();
                print(`ASR final: ${text}`);
                this.handleTranscript(text);
            }
        });

        // Handle errors
        options.onTranscriptionErrorEvent.add((errorCode) => {
            print(`ASR error: ${errorCode}`);
        });

        // Start ASR
        this.asrModule.startTranscribing(options);
        print("ASR session started");
    }

    private async handleTranscript(text: string) {
        // More robust matching
        // Examples: "bro where's my [wallet]", "bruh where are my [shoes]"
        const regex =
            /(?:bro|bruh|brah|dude)?\s*(?:where\s*(?:is|are|['’]s)?)\s*my\s*\[(.+?)\]/i;

        const match = text.match(regex);

        if (match) {
            const item = match[1].trim();
            print(`✅ Matched phrase, sending POST with item: ${item}`);
            await this.sendPost(item, text);
        } else {
            print("No trigger phrase detected.");
        }
    }

    private async sendPost(item: string, transcript: string) {
        const body = JSON.stringify({
            item,
            transcript, // send both extracted item + full sentence
        });

        try {
            await this.internetModule.fetch(
                new Request("http://10.37.127.253:8000/asr", {
                    method: "POST",
                    headers: { "Content-Type": "application/json" },
                    body,
                })
            );
            print(`POST sent with item=${item}`);
        } catch (err) {
            print("POST failed: " + err);
        }
    }

    private stopSession(): void {
        this.asrModule.stopTranscribing().then(() => {
            print("ASR session stopped");
        });
    }
}
