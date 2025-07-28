pageextension 50504 "Vendor CardExt" extends "Vendor Card"
{
    layout
    {
        addlast(content)
        {
            group("Gopi Customs")
            {
                field("Vendor Tier G"; Rec."Vendor Tier G")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Vendor Tier G field.', Comment = '%';
                }
            }
        }
    }
}
