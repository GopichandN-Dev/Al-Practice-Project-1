page 50504 "Student Marks Subform"
{
    ApplicationArea = All;
    Caption = 'Student Marks Subform';
    PageType = ListPart;
    SourceTable = "Student Marks";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Entry No."; Rec."Entry No.")
                {
                    ToolTip = 'Specifies the value of the Entry No. field.', Comment = '%';
                    Editable = false;
                }
                field("Student ID"; Rec."Student ID")
                {
                    ToolTip = 'Specifies the value of the Student ID field.', Comment = '%';
                    Editable = false;
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
