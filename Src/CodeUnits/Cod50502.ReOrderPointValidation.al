codeunit 50502 "ReOrder Point Validation"
{
    [EventSubscriber(ObjectType::Table, Database::Item, OnAfterValidateEvent, 'Reorder Point', false, false)]
    local procedure OnAfterValidateEvent(var Rec: Record Item; var xRec: Record Item; CurrFieldNo: Integer)
    begin
        if Rec."Reorder Point" > Rec.Inventory then begin
            Message('%1 is Greather Than Inventory %2', Rec."Reorder Point", Rec.Inventory);
        end;
    end;

    [EventSubscriber(ObjectType::Table, Database::Item, OnAfterInsertEvent, '', false, false)]
    local procedure OnAfterInsertEvent(var Rec: Record Item; RunTrigger: Boolean)
    begin
        if Rec."Reorder Point" = 0 then
            Rec."Reorder Point" := 10;
    end;
    //DummyChangeforPush/Pull
    //DummyChange3ForPush/Pull
    //DummyChange4
}