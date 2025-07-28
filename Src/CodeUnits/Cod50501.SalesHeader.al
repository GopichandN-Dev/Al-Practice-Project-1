codeunit 50501 "SalesHeaderDeliveryDateMgt"
{
    [EventSubscriber(ObjectType::Table, Database::"Sales Header", OnAfterValidateEvent, 'Sell-to Customer No.', false, false)]
    local procedure OnAfterValidateEvent(var Rec: Record "Sales Header"; var xRec: Record "Sales Header"; CurrFieldNo: Integer)
    begin
        if Rec."Sell-to Customer No." <> '' then begin
            if Rec."Order Date" <> 0D then
                Rec."Requested Delivery Date" := CalcDate('7D', Rec."Order Date");
        end;
    end;

    [EventSubscriber(ObjectType::Table, Database::"Sales Header", OnAfterValidateEvent, 'Sell-to Customer No.', false, false)]
    local procedure OnAfterValidatingCustomer(var Rec: Record "Sales Header"; var xRec: Record "Sales Header"; CurrFieldNo: Integer)
    var
        CustomerRec: Record Customer;
    begin
        if Rec."Sell-to Customer No." <> '' then begin
            if CustomerRec.Get(Rec."Sell-to Customer No.") then
                Rec."Shipment Code G" := CustomerRec."Shipment Method Code";
        end;
    end;

    [EventSubscriber(ObjectType::Table, Database::"Sales Header", OnAfterValidateEvent, 'Sell-to Customer No.', false, false)]
    local procedure OnAfterValidatingCustomerNo(var Rec: Record "Sales Header"; var xRec: Record "Sales Header"; CurrFieldNo: Integer)
    var
        CustomerRec: Record Customer;
    begin
        if Rec."Sell-to Customer No." <> '' then begin
            if CustomerRec.Get(Rec."Sell-to Customer No.") then
                Rec."Customer Type G" := CustomerRec."Customer Type G";
        end;
    end;
}
