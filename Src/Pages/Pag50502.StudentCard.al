page 50502 "Student Card"
{
    ApplicationArea = All;
    Caption = 'Student Card';
    PageType = Card;
    SourceTable = "Student Header";

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';

                field("Student ID"; Rec."Student ID")
                {
                    ToolTip = 'Specifies the value of the Student ID field.', Comment = '%';
                    Visible = false;
                }
                field("Student Name"; Rec."Student Name")
                {
                    ToolTip = 'Specifies the value of the Student Name field.', Comment = '%';
                }
                field("Date of Birth"; Rec."Date of Birth")
                {
                    ToolTip = 'Specifies the value of the Date of Birth field.', Comment = '%';
                }
                field(Age; Rec.Age)
                {
                    ToolTip = 'Specifies the value of the Age field.', Comment = '%';
                }
            }
            group("Study Info")
            {
                field(Grade; Rec.Grade)
                {
                    ToolTip = 'Specifies the value of the Grade field.', Comment = '%';
                }
                field("Std. Grade"; Rec."Std. Grade")
                {
                    ToolTip = 'Specifies the value of the Std. Grade field.', Comment = '%';
                }
                field("Date of Joining "; Rec."Date of Joining ")
                {
                    ToolTip = 'Specifies the value of the Date of Joining field.', Comment = '%';
                }
                field("Average Marks"; Rec."Average Marks")
                {
                    ToolTip = 'Specifies the value of the Average Marks field.', Comment = '%';
                }
                field("Results Status"; Rec."Results Status")
                {
                    ToolTip = 'Specifies the value of the Results Status field.', Comment = '%';
                }
            }
            part("Student Marks"; "Student Marks Subform")
            {
                ApplicationArea = All;
                SubPageLink = "Student ID" = field("Student ID");
                Enabled = true;
                Visible = true;
            }
        }
    }
    trigger OnAfterGetCurrRecord()
    begin
        CurrPage.Update();
    end;

}