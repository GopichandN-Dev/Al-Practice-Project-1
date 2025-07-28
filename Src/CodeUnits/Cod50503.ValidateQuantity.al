codeunit 50503 ValidateQuantity
{
    [EventSubscriber(ObjectType::Table, Database::"Sales Line", OnAfterValidateEvent, 'Quantity', false, false)]
    local procedure OnAfterValidateEvent(var Rec: Record "Sales Line"; var xRec: Record "Sales Line"; CurrFieldNo: Integer)
    var
        ItemRec: Record Item;
    begin
        if Rec.Quantity <> 0 then begin
            if ItemRec.Get(Rec."No.") then begin
                if Rec.Quantity < ItemRec."Minimum Order Quantity G" then
                    Error('Quantity should be Greater than or Equal to Minimum Order Quantity');
            end;
            if Rec.Quantity > 100 then
                Error('Quantity Should be Less Than 100');
        end;
    end;
}
