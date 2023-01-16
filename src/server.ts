import express from "express";
import prisma from "./db";

const app = express();

app.get("/", async (req, res) => {
    const cars = await prisma.car.findMany({});

    res.json({cars});
});

app.post("/user", async (req, res) => {
    console.log("Adding user...");
    const user = await prisma.user.create({
        data: {
            username: "max",
            password: "asdfasdf"
        },
    });

    res.json({user});
});

app.post("/car", async (req, res) => {
    console.log("Adding car!!");

    const user = await prisma.user.findFirst({
        where: {
            username: "max",
        },
    });

    const car = await prisma.car.create({
        data: {
            belongsToId: user.id,
            make: "Audi",
            model: "Ferrari A6",
            year: 2006,
            color: "transparent",
            mileage: -500,
            wheelCount: 2,
        }
    });

    res.json({car});
});

export default app;