page 50503 "Student Marks List"
{
    ApplicationArea = All;
    Caption = 'Student Marks List G';
    PageType = List;
    SourceTable = "Student Marks";
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Entry No."; Rec."Entry No.")
                {
                    ToolTip = 'Specifies the value of the Entry No. field.', Comment = '%';
                }
                field("Student ID"; Rec."Student ID")
                {
                    ToolTip = 'Specifies the value of the Student ID field.', Comment = '%';
                }
                field(Subject; Rec.Subject)
                {
                    ToolTip = 'Specifies the value of the Subject field.', Comment = '%';
                }
                field(Marks; Rec.Marks)
                {
                    ToolTip = 'Specifies the value of the Marks field.', Comment = '%';
                }
                field("Result Status"; Rec."Result Status")
                {
                    ToolTip = 'Specifies the value of the Result Status field.', Comment = '%';
                }
            }
        }
    }
}
