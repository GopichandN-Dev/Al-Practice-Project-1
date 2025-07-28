pageextension 50502 "Customer ListExt" extends "Customer List"
{
    actions
    {
        addlast(processing)
        {
            action("Total Invoice Amount")
            {
                Image = Totals;
                ApplicationArea = All;
                trigger OnAction()
                var
                    CustomerRec: Record Customer;
                    SalesInvHeader: Record "Sales Invoice Header";
                    TotalInvoiceAmount: Decimal;
                    ResultMsg: Text[200];
                begin
                    CustomerRec.Reset();
                    if CustomerRec.FindSet() then begin
                        repeat
                            TotalInvoiceAmount := 0;
                            SalesInvHeader.Reset();
                            SalesInvHeader.SetRange("Bill-to Customer No.", CustomerRec."No.");
                            if SalesInvHeader.FindSet() then begin
                                repeat
                                    SalesInvHeader.CalcFields(SalesInvHeader.Amount);
                                    TotalInvoiceAmount := TotalInvoiceAmount + SalesInvHeader.Amount;
                                until SalesInvHeader.Next() = 0;
                                if TotalInvoiceAmount > 100000 then
                                    Message('%1 with,%2 Invoiced Amount > 1,00,000', CustomerRec.Name, TotalInvoiceAmount)
                                else
                                    Message('%1 with,%2 Invoiced Amount < 1,00,000', CustomerRec.Name, TotalInvoiceAmount);
                            end;
                        //ResultMsg := ResultMsg + StrSubstNo('%1: %2', CustomerRec.Name, Format(TotalInvoiceAmount, 0, '<Precision,2:2><Standard Format,0>')) + Format()::NewLine;
                        until CustomerRec.Next() = 0;
                    end;
                    // if ResultMsg <> '' then
                    //     Message('Customers with Invoiced Amount > ₹1,00,000:\%1', ResultMsg)
                    // else
                    //     Message('No customers found with Invoiced Amount > ₹1,00,000.');
                end;
            }
        }
    }
}
