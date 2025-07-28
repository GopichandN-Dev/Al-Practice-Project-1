pageextension 50505 ItemCardExt extends "Item Card"
{
    layout
    {
        addlast(content)
        {
            group("Gopi Customs")
            {
                field("Minimum Order Quantity G"; Rec."Minimum Order Quantity G")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Minimum Order Quantity G field.', Comment = '%';
                }
                field("Default Warranty"; Rec."Default Warranty G")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Default Warranty field.', Comment = '%';
                }
            }
        }
    }
}
