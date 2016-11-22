create or replace function FirstChinese(strChinese1 In varchar2) return varchar2 is
  Result varchar2(2000);
  lngAllAsc number;
  lngFirstAsc number;
  strChinese varchar2(2000);
begin
    Result := '';
    strChinese := strChinese1 || ' ';
    While (LengthB(strChinese) > 1) LOOP
      lngAllAsc := floor(Ascii(strChinese)/256);
      If lngAllAsc >160 then
--        lngAllAsc := Ascii(strChinese);
--        lngFirstAsc := Ascii(substrb(substrb(strChinese,1, 2),1,2));
--        lngAllAsc := floor(Ascii(strChinese)/256);
        lngFirstAsc := mod(Ascii(substrb(strChinese,1, 2)),256);
        if lngAllAsc = 176 then
            If lngFirstAsc <= 196 Then
               Result := Result || 'A';
            End If;
            If lngFirstAsc >= 197 Then
               Result := Result || 'B';
            End If;
        elsif lngAllAsc = 177 then
            Result := Result || 'B';
        elsif lngAllAsc = 178 then
            If lngFirstAsc <= 192 Then
               Result := Result || 'B';
            End If;
            If lngFirstAsc >= 193 Then
               Result := Result || 'C';
            End If;
        elsif lngAllAsc = 179 then
            Result := Result || 'C';
        elsif lngAllAsc = 180 then
            If lngFirstAsc <= 237 Then
               Result := Result || 'C';
            End If;
            If lngFirstAsc >= 238 Then
               Result := Result || 'D';
            End If;
        elsif lngAllAsc = 181 then
            Result := Result || 'D';
        elsif lngAllAsc = 182 then
            If lngFirstAsc <= 233 Then
               Result := Result || 'D';
            End If;
            If lngFirstAsc >= 234 Then
               Result := Result || 'E';
            End If;
        elsif lngAllAsc = 183 then
            If lngFirstAsc <= 161 Then
               Result := Result || 'E';
            End If;
            If lngFirstAsc >= 162 Then
               Result := Result || 'F';
            End If;
        elsif lngAllAsc = 184 then
            If lngFirstAsc <= 192 Then
               Result := Result || 'F';
            End If;
            If lngFirstAsc >= 193 Then
               Result := Result || 'G';
            End If;
        elsif lngAllAsc = 185 then
            If lngFirstAsc <= 253 Then
               Result := Result || 'G';
            End If;
            If lngFirstAsc >= 254 Then
               Result := Result || 'H';
            End If;

        elsif lngAllAsc = 186 then
            Result := Result || 'H';

        elsif lngAllAsc = 187 then
            If lngFirstAsc <= 246 Then
               Result := Result || 'H';
            End If;
            If lngFirstAsc >= 247 Then
               Result := Result || 'J';
            End If;
        elsif (lngAllAsc = 188 or lngAllAsc = 189 or lngAllAsc = 190) then
            Result := Result || 'J';
        elsif lngAllAsc = 191 then
            If lngFirstAsc <= 165 Then
               Result := Result || 'J';
            End If;
            If lngFirstAsc >= 166 Then
               Result := Result || 'K';
            End If;
        elsif lngAllAsc = 192 then
            If lngFirstAsc <= 171 Then
               Result := Result || 'K';
            End If;
            If lngFirstAsc >= 172 Then
               Result := Result || 'L';
            End If;
        elsif lngAllAsc = 193 then
            Result := Result || 'L';

        elsif lngAllAsc = 194 then
            If lngFirstAsc <= 231 Then
               Result := Result || 'L';
            End If;
            If lngFirstAsc >= 232 Then
               Result := Result || 'M';
            End If;

        elsif lngAllAsc = 195 then
            Result := Result || 'M';
        elsif lngAllAsc = 196 then
            If lngFirstAsc <= 194 Then
               Result := Result || 'M';
            End If;
            If lngFirstAsc >= 195 Then
               Result := Result || 'N';
            End If;
        elsif lngAllAsc = 197 then
            If lngFirstAsc <= 181 Then
               Result := Result || 'N';
            End If;
            If (lngFirstAsc >= 182 And lngFirstAsc <= 189) Then
               Result := Result || 'O';
            End If;
            If lngFirstAsc >= 190 Then
               Result := Result || 'P';
            End If;
        elsif lngAllAsc = 198 then
            If lngFirstAsc <= 217 Then
               Result := Result || 'P';
            End If;
            If lngFirstAsc >= 218 Then
               Result := Result || 'Q';
            End If;
        elsif lngAllAsc = 199 then
            Result := Result || 'Q';
        elsif lngAllAsc = 200 then
            If lngFirstAsc <= 186 Then
               Result := Result || 'Q';
            End If;
            If (lngFirstAsc >= 187 And lngFirstAsc <= 245) Then
               Result := Result || 'R';
            End If;
            If lngFirstAsc >= 246 Then
               Result := Result || 'S';
            End If;
        elsif (lngAllAsc = 201 or lngAllAsc = 202) then
            Result := Result || 'S';
        elsif lngAllAsc = 203 then
            If lngFirstAsc <= 249 Then
               Result := Result || 'S';
            End If;
            If lngFirstAsc >= 250 Then
               Result := Result || 'T';
            End If;
        elsif lngAllAsc = 204 then
            Result := Result || 'T';
        elsif lngAllAsc = 205 then
            If lngFirstAsc <= 217 Then
               Result := Result || 'T';
            End If;
            If lngFirstAsc >= 218 Then
               Result := Result || 'W';
            End If;
        elsif lngAllAsc = 206 then
            If lngFirstAsc <= 243 Then
               Result := Result || 'W';
            End If;
            If lngFirstAsc >= 244 Then
               Result := Result || 'X';
            End If;
        elsif lngAllAsc = 207 then
            Result := Result || 'X';
        elsif lngAllAsc = 208 then
            Result := Result || 'X';
        elsif lngAllAsc = 209 then
            If lngFirstAsc <= 184 Then
               Result := Result || 'X';
            End If;
            If lngFirstAsc >= 185 Then
               Result := Result || 'Y';
            End If;
        elsif (lngAllAsc = 210 or lngAllAsc = 211) then
            Result := Result || 'Y';
        elsif lngAllAsc = 212 then
            If lngFirstAsc <= 208 Then
               Result := Result || 'Y';
            End If;
            If lngFirstAsc >= 209 Then
               Result := Result || 'Z';
            End If;
        elsif (lngAllAsc > 212 And lngAllAsc <= 216) Then
               Result := Result || 'Z';
        Else
               Result := Result || '?';
        End If;
        strChinese := substrb(strChinese, 3);
      else
        Result := Result || substr(strChinese, 1, 1);
        strChinese := substr(strChinese, 2);
      End If;
    End Loop;
    return(Result);
end FirstChinese;
/
