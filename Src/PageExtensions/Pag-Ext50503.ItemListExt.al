pageextension 50503 ItemListExt extends "Item List"
{
    actions
    {
        addlast(processing)
        {
            group("Gopi Customs")
            {
                action("Find")
                {
                    Image = Find;
                    ApplicationArea = All;
                    trigger OnAction()
                    var
                        ItemRec: Record Item;
                    begin
                        if ItemRec.FindSet() then begin
                            repeat
                                ItemRec.CalcFields(ItemRec.Inventory);
                                if ItemRec.Inventory < ItemRec."Reorder Point" then
                                    Message('%1:%2 < %3', ItemRec."No.", ItemRec.Inventory, ItemRec."Reorder Point")
                                else
                                    Message('%1:%2 > %3', ItemRec."No.", ItemRec.Inventory, ItemRec."Reorder Point");
                            until ItemRec.Next() = 0;
                        end;
                    end;
                }
            }
        }
    }
}
