table 50501 "Student Header"
{
    Caption = 'Student Header';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Student ID"; Code[20])
        {
            Caption = 'Student ID';
        }
        field(2; "Student Name"; Text[100])
        {
            Caption = 'Student Name';
        }
        field(3; "Date of Birth"; Date)
        {
            Caption = 'Date of Birth';
            trigger OnValidate()
            var
            begin
                if "Date of Birth" <> 0D then begin
                    Age := Date2DMY(Today(), 3) - Date2DMY("Date of Birth", 3);
                end;
            end;
        }
        field(4; Age; Integer)
        {
            Caption = 'Age';
        }
        field(5; Grade; Code[20])
        {
            Caption = 'Grade';
        }
        field(6; "Std. Grade"; Code[20])
        {
            Caption = 'Std. Grade';
        }
        field(7; "Date of Joining "; Date)
        {
            Caption = 'Date of Joining ';
        }
        field(8; "Average Marks"; Decimal)
        {
            Caption = 'Average Marks';
            FieldClass = FlowField;
            CalcFormula = average("Student Marks".Marks where("Student ID" = field("Student ID")));
        }
        field(9; "Results Status"; Enum "Result Status")
        {
            Caption = 'Results Status';
        }
        field(10; Refresher; Boolean)
        {
            Caption = 'Refresher';
            Editable = false;
        }

    }
    keys
    {
        key(PK; "Student ID")
        {
            Clustered = true;
        }
    }
    trigger OnInsert()
    begin
        "Student ID" := AutoGenerate();
    end;

    trigger OnModify()
    var
    begin
        Clear(Rank);
        CalcFields("Average Marks");
        AverageMarks("Average Marks");
        Grade := ValidateGrade();
        ValidateResultStatus(Rank);
    end;

    local procedure AverageMarks(Marks: Decimal)
    var
    begin
        if Marks >= 95 then
            Rank := 'A+'
        else if (Marks >= 90) then
            Rank := 'A'
        else if (Marks >= 85) then
            Rank := 'B+'
        else if (Marks >= 80) then
            Rank := 'B'
        else if (Marks >= 75) then
            Rank := 'C+'
        else if (Marks >= 70) then
            Rank := 'C'
        else if (Marks >= 65) then
            Rank := 'D+'
        else if (Marks >= 60) then
            Rank := 'D'
        else if (Marks >= 55) then
            Rank := 'E+'
        else if (Marks >= 40) then
            Rank := 'E'
        else if (Marks <> 0) AND (Marks < 35) then
            Rank := 'F'
        else if Marks = 0 then
            Rank := 'AB';
    end;

    local procedure ValidateResultStatus(Rank: Code[20])
    var
    begin
        if Rank = 'AB' then
            "Results Status" := "Results Status"::Absent
        else if Rank = 'F' then
            "Results Status" := "Results Status"::Fail
        else if (Rank in ['A+', 'A', 'B+', 'B', 'C+', 'C', 'D+', 'D', 'E+', 'E']) then
            "Results Status" := "Results Status"::Pass
        else
            "Results Status" := "Results Status"::" ";
    end;

    local procedure AutoGenerate(): Text
    var
        StudentHdrRec: Record "Student Header";
        StudentID: Text[50];
    begin
        if StudentHdrRec.FindLast() then
            StudentID := IncStr(StudentHdrRec."Student ID")
        else
            StudentID := 'STUD-001';
        exit(StudentID);
    end;

    local procedure ValidateGrade(): Text
    var
    begin
        exit(Rank);
    end;

    var
        Rank: Code[20];
}
