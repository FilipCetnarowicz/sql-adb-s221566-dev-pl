CREATE TABLE [dbo].[Product] (
    [ProductID]   INT            IDENTITY (1, 1) NOT NULL,
    [ProductName] NVARCHAR (100) NOT NULL,
    [Category]    NVARCHAR (100) NOT NULL,
    [UnitPrice]   MONEY          NOT NULL,
    PRIMARY KEY CLUSTERED ([ProductID] ASC)
);

