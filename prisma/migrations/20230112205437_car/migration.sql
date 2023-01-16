-- CreateEnum
CREATE TYPE "FUEL_TYPE" AS ENUM ('GAS', 'ELECTRIC', 'HYBRID', 'BANANA', 'SOLAR', 'FUSION');

-- CreateTable
CREATE TABLE "Car" (
    "id" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "make" TEXT NOT NULL,
    "model" TEXT NOT NULL,
    "year" INTEGER NOT NULL,
    "color" TEXT NOT NULL,
    "mileage" INTEGER NOT NULL,
    "wheelCount" INTEGER,
    "fuelType" "FUEL_TYPE" NOT NULL DEFAULT 'FUSION',
    "belongsToId" TEXT NOT NULL,

    CONSTRAINT "Car_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "Car" ADD CONSTRAINT "Car_belongsToId_fkey" FOREIGN KEY ("belongsToId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
