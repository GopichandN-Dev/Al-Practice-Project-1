tableextension 50503 ItemExt extends Item
{
    fields
    {
        field(50501; "Minimum Order Quantity G"; Integer)
        {
            Caption = 'Minimum Order Quantity G';
            DataClassification = ToBeClassified;
        }
        field(50502; "Default Warranty G"; Integer)
        {
            DataClassification = ToBeClassified;
        }
    }
    trigger OnInsert()
    var

    begin
        if "Default Warranty G" = 0 then
            "Default Warranty G" := 12;
    end;
}
