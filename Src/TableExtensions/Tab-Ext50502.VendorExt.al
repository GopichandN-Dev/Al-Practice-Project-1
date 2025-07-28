tableextension 50502 VendorExt extends Vendor
{
    fields
    {
        field(50501; "Vendor Tier G"; Enum "Vendor Tier G")
        {
            Caption = 'Vendor Tier G';
            DataClassification = ToBeClassified;
            trigger OnValidate()
            var
            begin
                CalcFields(Balance);
                if Balance > 3000 then
                    "Vendor Tier G" := "Vendor Tier G"::Platinum
                else if Balance > 1000 then
                    "Vendor Tier G" := "Vendor Tier G"::Gold
                else if Balance > 500 then
                    "Vendor Tier G" := "Vendor Tier G"::Silver
                else
                    "Vendor Tier G" := "Vendor Tier G"::" ";
            end;
        }
    }
    trigger OnInsert()
    var
    begin
        if "Vendor Tier G" = "Vendor Tier G"::" " then
            "Vendor Tier G" := "Vendor Tier G"::Silver;
    end;
}