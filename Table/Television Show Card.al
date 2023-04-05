page 50100 "Television Show Card"
{
    PageType = Card;
    SourceTable = "Television Show";
    DelayedInsert = true;
    layout
    {
        area(Content)
        {
            group(General)
            {
                field(Code; Rec.Code)
                {
                    ApplicationArea = All;
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                }
                field(Sypnosis; Rec.Sypnosis)
                {
                    ApplicationArea = All;
                    Editable = sypnosis;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                    Editable = status;

                }
                field("First Aired"; Rec."First Aired")
                {
                    ApplicationArea = All;
                }
                field("Last Aired"; Rec."Last Aired")
                {
                    ApplicationArea = All;
                }
                field(Gender; Rec.Gender)
                {
                    ApplicationArea = All;
                }
                field(WatchFromHome; Rec.WatchFromHome)
                {
                    ApplicationArea = All;
                    trigger OnValidate()
                    begin
                        if Rec.watchFromHome then begin
                            sypnosis := false;
                            status := false;
                            Rec.status := Rec.Status::Finished;
                        end

                        else begin

                            sypnosis := true;
                            status := true;
                            // Rec.status.Editable := false;
                            // Synopsis.Visible := true;
                        end;
                    end;
                }
            }
        }
    }

    var
        //watchFromHome: Boolean;
        sypnosis: Boolean;
        status: Boolean;
}

