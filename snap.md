Hack the North Hackers Guide
Table of Contents
About Bluetooth Low Energy (BLE)
Basic Setup & BLE
BLE Connectivity Contingency Plan
Bitmoji Animation
About 3D Gen
Basic 3D Gen Setup
Dev Resources
Access External API’s
Hacker Inspiration

Just so you know :) 

To turn on the headset hold the button on the right side of the glasses

To record a video snap press on the left side of the glasses


Keep in mind that the official documentation is here 

https://developers.snap.com/spectacles/about-spectacles-features/apis/bluetooth

Here we will offer a deep dive of the main concepts


Core Idea: Central vs Peripheral
Spectacles act as the central device (controller/client).
Peripherals (like heart-rate monitors or lamps) are GATT servers that advertise themselves.

What is GATT (Generic Attribute Profile)
GATT is the protocol for structured data exchange.
Services = groups of related functions.
Characteristics = individual data points you can read/write.
Descriptors = metadata about characteristics.

Flow of Using Bluetooth on Spectacles
1. Scan → search for devices.
2. Connect → establish GATT connection.
3. Discover Services → see what device offers.
4. Read/Write Characteristics → interact with data.
5. Subscribe (Notify) → get updates on changes.
6. Disconnect → release resources.

Why This Matters
Fitness: heart rate in Lens.
Smart Home: control a lamp.
IoT prototyping: sensors + custom devices.

Privacy & Permissions
Using Bluetooth disables camera, mic, location in that Lens.
Extended permissions exist for testing, but not for public release.

Single vs Multi-Device
Single device: stop scan once found.
Multiple devices: collect results, connect sequentially (not parallel).

(Optional) nRF Connect 
https://apps.apple.com/us/app/nrf-connect-for-mobile/id1054362403

nRF Connect is a powerful generic tool that allows you to scan and explore your Bluetooth Low Energy (henceforth Bluetooth LE, also called Bluetooth Version 4.0+ of the Bluetooth specification) devices and communicate with them.

Limitations
BLE API is experimental and may change.
Only GATT devices are supported (no HID).
Testing requires Spectacles hardware (not Lens Studio preview).
Case-insensitive UUIDs.
Uint8Array only (signed ints not tested).

Key Takeaways
Spectacles can connect to smart devices via BLE.
Enables physical + digital experiences.
Follow cycle: Scan → Connect → Discover → Interact → Notify → Disconnect.
Know the limitations and always test with nRF Connect.


See full video tutorial here or go step by step with the document below 



https://youtu.be/6-mDVlAQDl0?si=QLecNOgPH8UCjOip


Lens Studio and Spectacles App Pairing 

Make sure you have a Snapchat Account 
If you do not, please sign up 
https://www.snapchat.com/

Download Lens Studio 5.12.1 https://ar.snap.com/download/v5-12-1
DO NOT download 5.13 (the latest) 
Make sure you are logged in into Lens Studio 

Note: if your spectacles are not pairing correctly with lens studio you might need to log out and re-login to lens studio. 



Download the Spectacles App on your phone 
Sign in with the snapchat account 
Pair your spectacles holding the left button on the glasses (Not the right button, the right button is “capture”) 
This process will 
Go on the Spectacles App -> Developer Settings -> Enable Wired Connectivity

You can pair through this screen but once you open the app the pairing should be asked automatically


Be sure to enable wired connectivity and extended permissions 


Note that if you experience weird behavior you can always restart the procedure Erasing all the content and settings and restarting form scratch 


Starting from the BLE Sample Project 

There is one project in particular to get started with your journey and its the BLE Sample Project that you can find in two ways 

1.) From the Lens Studio Home Page 



Or 
2.) From the Sample Repository 
(This will require to clone the whole repository) 



Go on terminal and write 

cd [drag and drop a folder] 


*Please DO NOT use paths on an external hard drive or cloud based directories like google drive desktop or similar 

Then 

git lfs install 


If you do NOT have lfs look into this 
https://git-lfs.com/
And install it 

git clone https://github.com/Snapchat/Spectacles-Sample.git


As a windows user you might find some blockers. 
See resolution here (Long Paths) 
https://learn.microsoft.com/en-us/windows/win32/fileio/maximum-file-path-limitation?tabs=registry#enable-long-paths-in-windows-10-version-1607-and-later

The first thing you need to do is 

Testing the project and make sure that works 

You will need to 

Open the BLE Project 

SAVE IT 
Make sure you have enabled Experimental APIs
Should be automatically on if you start from the BLE sample project, however to be preserved on the build you will need to save your project.  
Please DO NOT save on an external hard drive or cloud based directories like google drive desktop or similar 

Connect Spectacles to lens studio 
Send the Lens to the Device
Pair the Joystick 
Test It!

Test the project 

Once the project is open 
Plugin Spectacles with the USB-C cable and preview the lens on top right 
This should send your lens to Spectacles. 


This blue icon with specs means that your specs are CONNECTED to Lens Studio.
If they are not connecting, follow these steps:
TODO: PUT STUFF HERE FOR DEBUG (SLIDES)

Note: 
Make sure you went through the steps above
Your spectacles are turned on 
You see the Lens Explorer 
You are logged into Lens Studio 
See your profile on the top right 

Spectacles are properly connected 

See here some resources regarding this topic 
https://developers.snap.com/spectacles/get-started/start-building/connecting-lens-studio-to-spectacles

Connect the XBOX controller 

Now you will need to connect your Bluetooth Controller to move the Bitmoji 

Make sure your controller have batteries

Press down and make sure the main XBOX center feedback button is flashing on and off then hold the pairing button 



Note:
If does not work try the following steps

Your XBOX Controller might be already paired to some other central devices - to detach from any device and reset the controller keep holding the pairing button for 10 seconds until the controller vibrates - this will detach the controller from any device 
Now close the Lens and Reopen it, and try the pairing process again. 


You can follow up some logs from the Lens Studio console to follow the pairing process if your Spectacles are plugged to your pc with a usb c cable 

You should see the following the following logs 



You arrived at the end of the required setup, now let’s start hacking! 
Snap3D Deep Dive
Keep in mind that the official documentation is here:
 👉 Remote Service Gateway API
Here we will offer a deep dive into the main concepts.

Core Idea: Remote Service Gateway
The Remote Service Gateway is the way Spectacles can safely interface with external AI services like Gemini, OpenAI, and others.
This mechanism was designed to bypass the Experimental API restrictions that prevent publishing lenses on Lens Explorer.
📌 Note: Any Lens that uses BLE still counts as Experimental, so you’ll need to enable Experimental APIs in Lens Studio settings.
See more about Experimental API:
Permissions & Privacy Overview
Experimental APIs



What is Snap3D?
Snap3D is the feature that allows you to turn text prompts → images → 3D models.
Prompt: User enters a description.
Image: AI service generates a 2D image.
3D Model: Remote service converts that image into a 3D asset that can be placed in the Lens.
This enables immersive AI-powered creation directly from Spectacles.

Flow of Using Snap3D with Remote Service Gateway
This flow is shown in the AI Playground Sample Project
Prompt → user enters text input.
Send to Remote Service → Spectacles securely communicate with AI service.
Image Generation → remote AI returns a 2D concept image.
3D Conversion → pipeline transforms that image into a usable 3D model (InteractableSnap3DGenerator.ts).
Place in Scene → Lens renders the model in AR.
Interaction → use scripts (like Snap3DInteractable.ts) to manipulate the object.


Example Code & Samples
A more advanced multi-model coordination example:
Agentic Playground repo
AI Playground Tutorial (YouTube)

Limitations & Considerations
Latency: 3D model generation takes time (not instantaneous).
💡 Consider adding creative animations, transitions, or mini-games while waiting.
Experimental APIs: Lenses using BLE or other experimental features won’t be publishable.
Service Dependency: Requires Remote Service Gateway integration (no offline generation).

Keep in mind that creating a 3D model is NOT instantaneous, this takes a while, so calculate time accordingly (or maybe find ways to creatively hide the runtime of the model? 😜)

A more advanced example of coordinating multiple 3D creation can be seen in this sample 
https://github.com/Snapchat/Spectacles-Sample/tree/main/Agentic%20Playground

That comes with a whole tutorial that guides you through the AI Playground as well 
https://www.youtube.com/watch?v=W00iMOaGUVM

Key Takeaways
Snap3D enables text-to-3D workflows directly in Spectacles.
Powered via Remote Service Gateway, connecting to external AI safely.
Follow cycle: Prompt → Image → 3D → Place → Interact.
Plan around runtime delays in model creation.
Explore AI Playground repos for practical examples.

See full video tutorial here or go step by step with the document below 




https://www.youtube.com/watch?v=W00iMOaGUVM&list=PLDrNdrvfcvHPxBmQg51-bXU25_laBPRXK&index=3


Ideas to use in this tutorial

Real Life Object to 3D Virtual Model via Specs Camera 2D Image -> 3D Model.
See potential home decor in Specs.

Lens Studio and Spectacles App Pairing 

Make sure you have a Snapchat Account 
If you do not, please sign up 
https://www.snapchat.com/

Download Lens Studio 5.12.1 https://ar.snap.com/download/v5-12-1
DO NOT download 5.13 (the latest) 
Make sure you are logged in into Lens Studio 

Note: if your spectacles are not pairing correctly with lens studio you might need to log out and re-login to lens studio. 



Download the Spectacles App on your phone 
Sign in with the snapchat account 
Pair your spectacles holding the left button on the glasses (Not the right button, the right button is “capture”) 
This process will 
Go on the Spectacles App -> Developer Settings -> Enable Wired Connectivity

You can pair through this screen but once you open the app the pairing should be asked automatically


Be sure to enable wired connectivity and extended permissions 


Note that if you experience weird behavior you can always restart the procedure Erasing all the content and settings and restarting form scratch 


Starting from the AI Playground Project

There is one project in particular to get started with your journey and its the AI Playground Project that you can find in two ways 

1.) From the Lens Studio Home Page 





Or 
2.) From the Sample Repository 
(This will require to clone the whole repository) 



Go on terminal and write 

cd [drag and drop a folder] 


*Please DO NOT use paths on an external hard drive or cloud based directories like google drive desktop or similar 

Then 

git lfs install 


If you do NOT have lfs look into this 
https://git-lfs.com/
And install it 

git clone https://github.com/Snapchat/Spectacles-Sample.git


As a windows user you might find some blockers. 
See resolution here (Long Paths) 
https://learn.microsoft.com/en-us/windows/win32/fileio/maximum-file-path-limitation?tabs=registry#enable-long-paths-in-windows-10-version-1607-and-later

The first thing you need to do is 

Testing the project and make sure that works 

You will need to 

Open the AI Playground Project
Connect Spectacles to lens studio 
Send the Lens to the Device
Test it!

Test the project 

Once the project is open 
Plugin Spectacles with the USB-C cable and preview the lens on top right 
This should send your lens to Spectacles. 


This blue icon with specs means that your specs are CONNECTED to Lens Studio.
If they are not connecting, follow these steps:
TODO: PUT STUFF HERE FOR DEBUG (SLIDES)


Note: Make sure you went through the steps above
Your spectacles are turned on 
You see the Lens Explored 
You are logged into Lens Studio 
See your profile on the top right 

Spectacles are properly connected 

See here some resources regarding this topic 
https://developers.snap.com/spectacles/get-started/start-building/connecting-lens-studio-to-spectacles


You arrived at the end of the required setup, now let’s start hacking! 





Reddit 
Show off your demos and ask questions
https://www.reddit.com/r/Spectacles/


Up for a challenge?
Win prizes with your lenses 
https://developers.snap.com/spectacles/spectacles-community/community-challenge
https://lenslist.co/spectacles-community-challenges

Sample Projects
These are also on the lens studio home page, they are the same but in a git repo 
Remember to Git LFS before to Clone 
https://github.com/Snapchat/Spectacles-Sample

About Git LFS 
https://git-lfs.com/

On windows make sure you have git installed 
https://git-scm.com/downloads

On Mac make sure you have git installed 
https://git-scm.com/downloads/mac

If you are not too familiar with the CLI git 
Take a look at GitHub Desktop 
https://desktop.github.com/download/

Official Spectacles Tutorial video playlist 
https://www.youtube.com/watch?v=hOQ68r_lKIQ&list=PLDrNdrvfcvHPxBmQg51-bXU25_laBPRXK

Unofficial Snap AR Tutorial videos 
https://www.youtube.com/@1fficialar

Highly recommended: The Essential Project  
Make sure to reference always this project that includes the foundations of creating a spectacles lens and common patterns you will face 
https://www.youtube.com/watch?v=T-6-mYvmeNc
https://github.com/Snapchat/Spectacles-Sample/tree/main/Essentials


Alternative to State Machine (Animator) 
https://developers.snap.com/lens-studio/api/lens-scripting/classes/Packages_SpectaclesInteractionKit_Utils_StateMachine.StateMachine.html


Highly recommended: Typescript mini course   
Includes a lot of good material you can feed to Cursor / Favorite flow 
https://www.youtube.com/watch?v=mV5nHg1mJ-g&list=PLDrNdrvfcvHNti0sL8v5z5YCbeO5zA7SP


General Hackathon Resources in depth 
Understand in depth our all ecosystem (as a hacker) 
https://developers.snap.com/spectacles/spectacles-community/hackathon-resources


Vibe coding with Lens Studio 
We recommend to use tools as 
Cursor 
GitHub Copilot 
And more alternatives 
To speed up your flow 

We highly recommend to clone the whole repository and use it as a CONTEXT so you can remind the AI assistant about certain implementations asking to recursively check examples or specific folders 

For example in this hackathon the most relevant sources will be 

In the sample project repository the following projects 

AI Playground 
Agentic Playground 
BLE Controller Sample 
Essentials 




We recommend to use the copy page buttons to feed the AI with some context from the docs 


See how to vibe code the right way in this video  
https://www.youtube.com/watch?v=Bwounr-QZqE


Past Projects 
Take a look at what hackers built in the past 

Previous community challenges
https://developers.snap.com/spectacles/spectacles-community/community-challenge

Dev post list 
https://www.linkedin.com/posts/alessio-grancini_if-youre-curious-about-what-developers-are-activity-7353888391882567681-XVsi?utm_source=share&utm_medium=member_desktop&rcm=ACoAABS9xJUBoUnq7rZARD1nmoElrSbzk-sy72E

Remote Service Gateway vs. Internet Module
Before we get started with what you need to interface with other, external APIs, we feel it’s important to know the differences between Remote Service Gateway vs. Internet Module.

Remote Service Gateway
Remote Service Gateway is the secure way for Spectacles Lenses to connect with AI-powered services like OpenAI, Google Gemini, DeepSeek, and Snap3D.

Unlike the Internet Module, it allows Lenses that use sensitive data (camera, location, audio) to still be published on Lens Explorer when calling these supported services.

Internet Module
Internet Module is the standard way for Spectacles Lenses to access the web—make requests with fetch or performHttpRequest, open WebSocket connections, and download remote media.

Note that enabling internet access disables privacy-sensitive data (camera frame, location, audio); HTTPS requests are publishable, while HTTP (insecure) and Extended Permissions are for testing only.

Fetch
Spectacles offers the standardized Fetch API to make https requests on the open internet. This means any other external APIs you’d like to access, you can do it with Fetch! This API is based on the Fetch MDN reference. Documentation for Fetch is below:

https://developers.snap.com/spectacles/about-spectacles-features/apis/internet-access

In addition, a sample project for Fetch is below:

https://github.com/Snapchat/Spectacles-Sample/tree/main/Fetch


Web Socket
Spectacles offers the standardized WebSocket API to connect to real-time streams on the internet. This API is based on the Websocket MDN reference. The documentation is below:

https://developers.snap.com/spectacles/about-spectacles-features/apis/web-socket

In addition, a sample project that utilized web sockets is the Public Speaker, where the system supports real-time adjustments, allowing the slides to update at a variable pace controlled by intuitive gestures, pinch actions, voice commands, or using the Spectacles mobile app. The sample project is below:

https://github.com/Snapchat/Spectacles-Sample/tree/main/Public%20Speaker

Agents
Finally, a more advanced AI project to take a look at is the Agentic Playground project, which utilizes the AI Playground project, and takes it to another level. Agentic Playground transforms lecture experiences with real-time speech processing, intelligent tool routing, multi-modal content generation, and spatial diagram creation - all running natively on Spectacles.

https://github.com/Snapchat/Spectacles-Sample/tree/main/Agentic%20Playground

Watch this video tutorial to learn about Agentic Playground: https://youtu.be/W00iMOaGUVM?si=w8HqylObhQXZu41B

Other APIs
These should get you started with getting data from external APIs. If you have any questions please check out Dev Resources, or find us at our booth/message Steven Le or Alessio Grancini on Slack!

Hacking Inspo 


Take a look at our Reddit showoffs 
https://www.reddit.com/

Take a look at our community lenses 
Grab the open sources project if available 
https://developers.snap.com/spectacles/spectacles-community/community-challenge#the-spectacles-community-challenge-is-open-

Take a look at our previous hacks 
Check out this extensive list from devpost 
https://www.reddit.com/r/Spectacles/comments/1n0wrqh/any_database_list_of_apps/?utm_source=share&utm_medium=web3x&utm_name=web3xcss&utm_term=1&utm_content=share_button

More Ideas 

Games 

Build a spaceship game in first person view or third person view that you can control with the joystick 
Something like this but using the magic of the XBOX Controller 

Extend the Bitmoji sample, you are the master of your bitmoji, exploring the world together. Add AI capabilities and make your emoji come to life. 
Something like this but using the magic of the XBOX Controller 
Using the Remote Service Gateway 

Build a shooting game like this one using the XBOX Controller 
https://youtube.com/shorts/WMnvuzjSSxU?feature=shared
https://youtube.com/shorts/BHTEnNHF6Qs?feature=shared
Create enemies with 3D Gen AI 

Build an Infinite game using DynamicLabs
https://x.com/dynamicslab_ai?lang=en
https://www.reddit.com/r/Spectacles/comments/1n2n6iy/turning_drawings_into_xr_worlds_you_can_play_in/?utm_source=share&utm_medium=web3x&utm_name=web3xcss&utm_term=1&utm_content=share_button


Utilities

Build a drone ground scanner that gets the altitude or any sort of information of your surroundings 
Using the world query module build a little floating spaceship that project a ray to the ground and leaves some feedback like a grid 
Pilot the virtual drone with the XBOX Controller

Take camera pictures of your sketches and feed them to the 3D Generation Pipeline, find a niche use case based on the environment you are in 
Use the XBOX Controller to guide the objects you created 
Something like this 
https://www.reddit.com/r/Spectacles/comments/1jv6krw/turn_drawings_into_3d_objects_in_realtime_with/

Manipulate a high fidelity car simulation with the XBOX Controller 

Simulate a drone fleet and form different composition in the open based on some combos on the XBOX Controller ,reward the player for their skills 
 
Ideas do not stop here, please go wild and build the future. 


