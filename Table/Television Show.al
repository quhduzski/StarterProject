table 50100 "Television Show"
{
    DataClassification = CustomerContent;
    fields
    {
        field(1; Code; Code[20])
        {
            NotBlank = true;
            DataClassification = CustomerContent;
        }
        field(2; Name; Text[80])
        {
            DataClassification = CustomerContent;
        }
        field(3; Gender; Option)
        {
            //NotBlank = true;
            OptionMembers = Male,Female;
            DataClassification = CustomerContent;
        }
        field(4; Sypnosis; Option)
        {
            OptionMembers = Positive,Negative;
            DataClassification = CustomerContent;
        }
        field(5; Status; Option)
        {
            OptionCaption = 'Active,Pending,Finished';   // This is not necessary as it serves as a repitition of the OptionMembers.
            OptionMembers = Active,Pending,Finished;
            DataClassification = CustomerContent;
        }
        field(6; "First Aired"; Date)
        {
            NotBlank = true;
            DataClassification = CustomerContent;
            trigger OnValidate()
            begin
                VerifyDate();
            end;
        }
        field(7; "Last Aired"; Date)
        {
            NotBlank = true;
            DataClassification = CustomerContent;
            trigger OnValidate()
            begin
                VerifyDate();
            end;
        }
        field(8; "Created By"; Code[50])
        {
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(9; WatchFromHome; Boolean)
        {

        }
    }
    keys
    {
        key(PK; Code)
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    begin
        "Created By" := UserId();
    end;

    local procedure VerifyDate()
    var
        FirstAiredDateCannotBeLaterErr: Label '%1 cannot be earlier than %2 ';
    begin
        if "Last Aired" = 0D then
            exit;

        if "First Aired" > "Last Aired" then
            Error(FirstAiredDateCannotBeLaterErr, FieldCaption("Last Aired"), FieldCaption("First Aired"));
    end;

    // below is another way of passing the error message of the above.

    // local procedure VerifyDate()
    // var
    //     FirstAiredDateCannotBeLaterErr: Text;
    // begin
    //     FirstAiredDateCannotBeLaterErr := 'First Aired cannot be greater than Last Aired';
    //     if "Last Aired" = 0D then
    //         exit;

    //     if "First Aired" > "Last Aired" then
    //         Error(FirstAiredDateCannotBeLaterErr);
    // end;
}
