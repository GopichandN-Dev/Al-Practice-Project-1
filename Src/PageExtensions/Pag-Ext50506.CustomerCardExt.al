pageextension 50506 CustomerCardExt extends "Customer Card"
{
    layout
    {
        addlast(content)
        {
            group("Gopi Customs")
            {
                field("Customer Type G"; Rec."Customer Type G")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Customer Type G field.', Comment = '%';
                }
            }
        }
    }
}
