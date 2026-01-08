CREATE TABLE [dbo].[ProductInventory] (
    [ProductID] INT NOT NULL,
    [Quantity]  INT NOT NULL,
    PRIMARY KEY CLUSTERED ([ProductID] ASC),
    CONSTRAINT [FK_ProductInventory] FOREIGN KEY ([ProductID]) REFERENCES [dbo].[Product] ([ProductID])
);

