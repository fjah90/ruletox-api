-- CreateTable
CREATE TABLE "User" (
    "userId" BIGSERIAL NOT NULL,
    "idRole" BIGINT NOT NULL,
    "name" VARCHAR(40) NOT NULL,
    "email" VARCHAR(40) NOT NULL,
    "username" VARCHAR(40) NOT NULL,
    "emailVerifiedAt" TIMESTAMP(3),
    "image" VARCHAR(255),
    "access" TEXT,
    "password" VARCHAR(255) NOT NULL,
    "lastLogin" TIMESTAMP(3),
    "createdAt" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3),

    CONSTRAINT "User_pkey" PRIMARY KEY ("userId")
);

-- CreateTable
CREATE TABLE "UserNotification" (
    "id" BIGSERIAL NOT NULL,
    "userId" BIGINT,
    "userSiteSiteId" INTEGER NOT NULL DEFAULT 0,
    "title" VARCHAR(255),
    "readStatus" BOOLEAN NOT NULL DEFAULT false,
    "clickUrl" TEXT,
    "createdAt" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3),

    CONSTRAINT "UserNotification_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "UserPasswordReset" (
    "id" BIGSERIAL NOT NULL,
    "userId" BIGINT,
    "email" VARCHAR(40) NOT NULL,
    "token" VARCHAR(40) NOT NULL,
    "status" BOOLEAN NOT NULL DEFAULT true,
    "createdAt" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3),

    CONSTRAINT "UserPasswordReset_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Bitacora" (
    "bitacoraId" SERIAL NOT NULL,
    "userId" INTEGER NOT NULL,
    "event" VARCHAR(190) NOT NULL,
    "description" VARCHAR(255) NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Bitacora_pkey" PRIMARY KEY ("bitacoraId")
);

-- CreateTable
CREATE TABLE "Deposit" (
    "id" BIGSERIAL NOT NULL,
    "transactionId" BIGINT,
    "userSiteId" INTEGER NOT NULL,
    "methodCode" INTEGER NOT NULL,
    "amount" DECIMAL(28,8) NOT NULL DEFAULT 0,
    "methodCurrency" VARCHAR(40) NOT NULL,
    "charge" DECIMAL(28,8) NOT NULL DEFAULT 0,
    "rate" DECIMAL(28,8) NOT NULL DEFAULT 0,
    "finalAmo" DECIMAL(28,8) NOT NULL DEFAULT 0,
    "detail" TEXT,
    "btcAmo" VARCHAR(255),
    "btcWallet" VARCHAR(255),
    "trx" VARCHAR(40),
    "try" INTEGER NOT NULL DEFAULT 0,
    "status" BOOLEAN NOT NULL DEFAULT false,
    "userAuthor" VARCHAR(190) NOT NULL,
    "fromApi" BOOLEAN NOT NULL DEFAULT false,
    "userFeedback" VARCHAR(255),
    "createdAt" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3),

    CONSTRAINT "Deposit_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "EmailLog" (
    "id" BIGSERIAL NOT NULL,
    "userId" BIGINT,
    "userSiteId" INTEGER NOT NULL,
    "mailSender" VARCHAR(40),
    "emailFrom" VARCHAR(40),
    "emailTo" VARCHAR(40),
    "subject" VARCHAR(255),
    "message" TEXT,
    "createdAt" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3),

    CONSTRAINT "EmailLog_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Gateway" (
    "gatewayId" SERIAL NOT NULL,
    "code" INTEGER,
    "name" VARCHAR(60) NOT NULL,
    "alias" VARCHAR(60) NOT NULL,
    "image" VARCHAR(191),
    "status" BOOLEAN NOT NULL DEFAULT true,
    "gatewayParameters" TEXT,
    "supportedCurrencies" TEXT,
    "crypto" BOOLEAN NOT NULL DEFAULT false,
    "extra" TEXT,
    "description" TEXT,
    "inputForm" TEXT,
    "createdAt" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3),

    CONSTRAINT "Gateway_pkey" PRIMARY KEY ("gatewayId")
);

-- CreateTable
CREATE TABLE "GatewayCurrency" (
    "id" SERIAL NOT NULL,
    "gatewayId" INTEGER NOT NULL,
    "name" VARCHAR(60),
    "currency" VARCHAR(10),
    "symbol" VARCHAR(3),
    "methodCode" INTEGER,
    "gatewayAlias" VARCHAR(25),
    "minAmount" DECIMAL(28,8) NOT NULL DEFAULT 0,
    "maxAmount" DECIMAL(28,8) NOT NULL DEFAULT 0,
    "percentCharge" DECIMAL(5,2) NOT NULL DEFAULT 0,
    "fixedCharge" DECIMAL(28,8) NOT NULL DEFAULT 0,
    "rate" DECIMAL(28,8) NOT NULL DEFAULT 0,
    "image" VARCHAR(191),
    "gatewayParameter" TEXT,
    "createdAt" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3),

    CONSTRAINT "GatewayCurrency_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Role" (
    "roleId" BIGSERIAL NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "guardName" VARCHAR(255) NOT NULL,
    "createdAt" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3),

    CONSTRAINT "Role_pkey" PRIMARY KEY ("roleId")
);

-- CreateTable
CREATE TABLE "Permission" (
    "id" BIGSERIAL NOT NULL,
    "permissionId" BIGINT,
    "name" VARCHAR(255) NOT NULL,
    "guardName" VARCHAR(255) NOT NULL,
    "createdAt" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3),

    CONSTRAINT "Permission_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "SupportAttachment" (
    "id" BIGSERIAL NOT NULL,
    "supportMessageId" INTEGER NOT NULL,
    "attachment" VARCHAR(255) NOT NULL,
    "createdAt" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3),

    CONSTRAINT "SupportAttachment_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "SupportMessage" (
    "id" SERIAL NOT NULL,
    "supportTicketId" INTEGER NOT NULL DEFAULT 0,
    "userId" INTEGER NOT NULL DEFAULT 0,
    "message" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3),

    CONSTRAINT "SupportMessage_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "SupportTicket" (
    "id" BIGSERIAL NOT NULL,
    "userSiteId" INTEGER NOT NULL DEFAULT 0,
    "name" VARCHAR(191),
    "email" VARCHAR(91),
    "ticket" VARCHAR(191),
    "subject" VARCHAR(191),
    "status" SMALLINT NOT NULL,
    "priority" INTEGER NOT NULL DEFAULT 0,
    "lastReply" TIMESTAMP(3),
    "createdAt" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3),

    CONSTRAINT "SupportTicket_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Transaction" (
    "transactionId" BIGSERIAL NOT NULL,
    "userId" INTEGER,
    "userSiteId" INTEGER,
    "amount" DECIMAL(28,8) NOT NULL DEFAULT 0,
    "charge" DECIMAL(28,8) NOT NULL DEFAULT 0,
    "postBalance" DECIMAL(28,8) NOT NULL DEFAULT 0,
    "trxType" VARCHAR(10),
    "trx" VARCHAR(25),
    "details" VARCHAR(255),
    "createdAt" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3),

    CONSTRAINT "Transaction_pkey" PRIMARY KEY ("transactionId")
);

-- CreateTable
CREATE TABLE "Winner" (
    "id" BIGSERIAL NOT NULL,
    "phaseId" INTEGER NOT NULL,
    "userId" INTEGER NOT NULL,
    "win" VARCHAR(191) NOT NULL,
    "amo" DECIMAL(18,8) NOT NULL,
    "createdAt" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3),

    CONSTRAINT "Winner_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Withdrawal" (
    "withdrawalId" SERIAL NOT NULL,
    "transactionId" BIGINT,
    "userSiteId" INTEGER NOT NULL,
    "methodId" INTEGER NOT NULL,
    "amount" DECIMAL(28,8) NOT NULL DEFAULT 0,
    "currency" VARCHAR(40) NOT NULL,
    "rate" DECIMAL(28,8) NOT NULL DEFAULT 0,
    "charge" DECIMAL(28,8) NOT NULL DEFAULT 0,
    "trx" VARCHAR(40) NOT NULL,
    "finalAmount" DECIMAL(28,8) NOT NULL DEFAULT 0,
    "afterCharge" DECIMAL(28,8) NOT NULL DEFAULT 0,
    "withdrawInformation" TEXT,
    "status" SMALLINT NOT NULL DEFAULT 0,
    "userFeedback" TEXT,
    "createdAt" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3),

    CONSTRAINT "Withdrawal_pkey" PRIMARY KEY ("withdrawalId")
);

-- CreateTable
CREATE TABLE "WithdrawMethod" (
    "id" SERIAL NOT NULL,
    "withdrawalId" INTEGER NOT NULL,
    "gatewayId" INTEGER NOT NULL,
    "name" VARCHAR(191),
    "image" VARCHAR(191),
    "minLimit" DECIMAL(28,8) NOT NULL DEFAULT 0,
    "maxLimit" DECIMAL(28,8) NOT NULL DEFAULT 0,
    "delay" VARCHAR(191),
    "fixedCharge" DECIMAL(28,8) NOT NULL DEFAULT 0,
    "rate" DECIMAL(28,8) NOT NULL DEFAULT 0,
    "percentCharge" DECIMAL(5,2) NOT NULL,
    "currency" VARCHAR(20),
    "userData" TEXT,
    "description" TEXT,
    "status" BOOLEAN NOT NULL DEFAULT true,
    "createdAt" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3),

    CONSTRAINT "WithdrawMethod_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "_BitacoraToUser" (
    "A" INTEGER NOT NULL,
    "B" BIGINT NOT NULL
);

-- CreateTable
CREATE TABLE "_PermissionToRole" (
    "A" BIGINT NOT NULL,
    "B" BIGINT NOT NULL
);

-- CreateTable
CREATE TABLE "_TransactionToUser" (
    "A" BIGINT NOT NULL,
    "B" BIGINT NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "User_email_key" ON "User"("email");

-- CreateIndex
CREATE UNIQUE INDEX "User_username_key" ON "User"("username");

-- CreateIndex
CREATE UNIQUE INDEX "_BitacoraToUser_AB_unique" ON "_BitacoraToUser"("A", "B");

-- CreateIndex
CREATE INDEX "_BitacoraToUser_B_index" ON "_BitacoraToUser"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_PermissionToRole_AB_unique" ON "_PermissionToRole"("A", "B");

-- CreateIndex
CREATE INDEX "_PermissionToRole_B_index" ON "_PermissionToRole"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_TransactionToUser_AB_unique" ON "_TransactionToUser"("A", "B");

-- CreateIndex
CREATE INDEX "_TransactionToUser_B_index" ON "_TransactionToUser"("B");

-- AddForeignKey
ALTER TABLE "Deposit" ADD CONSTRAINT "Deposit_transactionId_fkey" FOREIGN KEY ("transactionId") REFERENCES "Transaction"("transactionId") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "EmailLog" ADD CONSTRAINT "EmailLog_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("userId") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "GatewayCurrency" ADD CONSTRAINT "GatewayCurrency_gatewayId_fkey" FOREIGN KEY ("gatewayId") REFERENCES "Gateway"("gatewayId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Withdrawal" ADD CONSTRAINT "Withdrawal_transactionId_fkey" FOREIGN KEY ("transactionId") REFERENCES "Transaction"("transactionId") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "WithdrawMethod" ADD CONSTRAINT "WithdrawMethod_gatewayId_fkey" FOREIGN KEY ("gatewayId") REFERENCES "Gateway"("gatewayId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "WithdrawMethod" ADD CONSTRAINT "WithdrawMethod_withdrawalId_fkey" FOREIGN KEY ("withdrawalId") REFERENCES "Withdrawal"("withdrawalId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_BitacoraToUser" ADD CONSTRAINT "_BitacoraToUser_A_fkey" FOREIGN KEY ("A") REFERENCES "Bitacora"("bitacoraId") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_BitacoraToUser" ADD CONSTRAINT "_BitacoraToUser_B_fkey" FOREIGN KEY ("B") REFERENCES "User"("userId") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_PermissionToRole" ADD CONSTRAINT "_PermissionToRole_A_fkey" FOREIGN KEY ("A") REFERENCES "Permission"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_PermissionToRole" ADD CONSTRAINT "_PermissionToRole_B_fkey" FOREIGN KEY ("B") REFERENCES "Role"("roleId") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_TransactionToUser" ADD CONSTRAINT "_TransactionToUser_A_fkey" FOREIGN KEY ("A") REFERENCES "Transaction"("transactionId") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_TransactionToUser" ADD CONSTRAINT "_TransactionToUser_B_fkey" FOREIGN KEY ("B") REFERENCES "User"("userId") ON DELETE CASCADE ON UPDATE CASCADE;
