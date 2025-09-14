// index.ts
import cookieParser from "cookie-parser";
import cors from "cors";
import express, { NextFunction, Request, Response } from "express";
import morgan from "morgan";
import prisma from "./prisma/client";
import { schedule } from "node-cron";
import videoRouter from "./routes/video.router";
import imageRouter from "./routes/image.router";

const app = express();
const dev = process.env.NODE_ENV === "dev";

// Run the cron worker every day every hour
schedule("0 * * * *", async () => {
  try {
  } catch (error) {
    console.error("Failed to run cron job -- generic error", error);
  }
});

const port = process.env.PORT ?? "8081";
app.use(morgan("dev"));

// middleware
app.use(
  cors({
    origin: "*",
    methods: "GET,POST",
    allowedHeaders: [
      "Content-Type",
      "Authorization",
      "ngrok-skip-browser-warning"
    ],
  }),
);

app.use(express.json()); // parsing JSON in the request body
app.use(cookieParser());
app.use(express.urlencoded({ extended: true })); // parsing URL-encoded form data
app.use((req: Request, res: Response, next: NextFunction) => {
  res.header("Content-Type", "application/json");
  res.header("Access-Control-Allow-Origin", "*");
  res.header(
    "Access-Control-Allow-Headers",
    "Origin, X-Requested-With, Content-Type, Accept",
  );
  next();
});

// Routing middleware
app.use("/video", videoRouter);
app.use("/image", imageRouter);
app.get("/health-check", (req: Request, res: Response, next: NextFunction) => {
  res.status(200).json({ message: "OK" });
});


// server start
const server = app.listen(port, () => {
  console.log(`App listening at http://localhost:${port}`);
});


// Handle uncaught exceptions
process.on('uncaughtException', (err) => {
  console.error('UNCAUGHT EXCEPTION!');
  console.error(err.name, err.message);
  console.error('Stack:', err.stack);
  // Continue running the server instead of crashing
});

// Handle unhandled promise rejections
process.on('unhandledRejection', (err: Error) => {
  console.error('UNHANDLED REJECTION!');
  console.error(err.name, err.message);
  console.error('Stack:', err.stack);
  // Continue running the server instead of crashing
});

// Graceful shutdown
const gracefulShutdown = () => {
  console.log('\nGracefully shutting down...');
  server.close(async () => {
    try {
      await prisma.$disconnect();
      console.log('Prisma client disconnected');
      process.exit(0);
    } catch (err) {
      console.error('Error during shutdown:', err);
      process.exit(1);
    }
  });

  // Force shutdown after 10 seconds
  setTimeout(() => {
    console.error('Could not close connections in time, forcefully shutting down');
    process.exit(1);
  }, 10000);
};

process.on('SIGTERM', gracefulShutdown);
process.on('SIGINT', gracefulShutdown);

export default app;
export { server };