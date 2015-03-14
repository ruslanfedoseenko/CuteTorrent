; -- MUI_InstallShield.iss --

; ��ʾ���ʹ�� InstallShield ������� INNO ��װ����
; �ű��� restools ( http://restools.hanzify.org )
;#define x64
[Setup]
WizardSmallImageFile=bottom.bmp
AppName=CuteTorrent
AppVersion=0.9.2.8
DefaultDirName={pf}\CuteTorrent
DefaultGroupName=CuteTorrent
UninstallDisplayIcon={app}\CuteTorrent.exe
OutputDir=Output
OutputBaseFilename = CuteTorrent 0.9.2.8
SolidCompression=yes
Compression=lzma/ultra
WizardImageFile=Left.bmp
LicenseFile=license.txt
UsePreviousTasks=yes
#ifdef x64
; "ArchitecturesAllowed=x64" specifies that Setup cannot run on
; anything but x64.
ArchitecturesAllowed=x64
; "ArchitecturesInstallIn64BitMode=x64" requests that the install be
; done in "64-bit mode" on x64, meaning it should use the native
; 64-bit Program Files directory and the 64-bit view of the registry.
ArchitecturesInstallIn64BitMode=x64
#endif
[Tasks]
Name: DesctopIcon; Description: "Create desctop icon"; GroupDescription: Shortcuts:
Name: TorrentAssociation; Description: "Associate ""torrent"" extension"; GroupDescription: File extensions:
Name: MagnetAssociation; Description: "Open magnet links with CuteTorrent"; GroupDescription: File extensions:

[Registry]
Root: HKCR; Subkey: ".torrent"; ValueType: string; ValueName: ""; ValueData: "CuteTorrent.file"; Flags: uninsdeletevalue; Tasks: TorrentAssociation
Root: HKCR; Subkey: "CuteTorrent.file"; ValueType: string; ValueName: ""; ValueData: "Torrent File"; Flags: uninsdeletekey; Tasks: TorrentAssociation
Root: HKCR; Subkey: "CuteTorrent.file\DefaultIcon"; ValueType: string; ValueName: ""; ValueData: "{app}\CuteTorrent.exe,1"; Tasks: TorrentAssociation
Root: HKCR; Subkey: "CuteTorrent.file\shell\open\command"; ValueType: string; ValueName: ""; ValueData: """{app}\CuteTorrent.exe"" ""%1"""; Tasks: TorrentAssociation
Root: HKCR; Subkey: "Magnet"; ValueType: string; ValueName: ""; ValueData: "Magnet URI"; Flags: uninsdeletekey; Tasks: MagnetAssociation
Root: HKCR; Subkey: "Magnet"; ValueType: string; ValueName: "Content Type"; ValueData: "application/x-magnet"; Flags: uninsdeletekey; Tasks: MagnetAssociation
Root: HKCR; Subkey: "Magnet"; ValueType: string; ValueName: "URL Protocol"; ValueData: "application/x-magnet"; Flags: uninsdeletekey; Tasks: MagnetAssociation
Root: HKCR; Subkey: "Magnet\DefaultIcon"; ValueType: string; ValueName: ""; ValueData: "{app}\CuteTorrent.exe,1"; Tasks: MagnetAssociation
Root: HKCR; Subkey: "Magnet\shell\open\command"; ValueType: string; ValueName: ""; ValueData: """{app}\CuteTorrent.exe"" ""%1"""; Tasks: MagnetAssociation

[Files]
;{ ISFormDesignerFilesBegin } // �� ������� ��� ������!
;// �� �������� ��� ������. ��� ������� �������������.
DestName: "WizardForm.WizardBitmapImage2.bmp"; Source: "topline.bmp"; Flags: dontcopy solidbreak
;// �� �������� ��� ������. ��� ������� �������������.
;{ ISFormDesignerFilesEnd } // �� ������� ��� ������!
#ifdef x64
Source: "datax64\*"; DestDir: "{app}"; Flags:  recursesubdirs ignoreversion
#else
Source: "data\*"; DestDir: "{app}"; Flags:  recursesubdirs ignoreversion
#endif
[Icons]
Name: "{group}\CuteTorrent"; Filename: "{app}\CuteTorrent.exe"
Name: "{commondesktop}\CuteTorrent"; Filename: "{app}\CuteTorrent.exe"; Tasks: DesctopIcon
Name: "{group}\Uninstall CuteTorrent"; Filename: "{uninstallexe}"
[ISFormDesigner]
WizardForm=FF0A005457495A415244464F524D0030105327000054504630F10B5457697A617264466F726D0A57697A617264466F726D0C436C69656E7448656967687403CB010B436C69656E74576964746803B20205436F6C6F72043162AC000C4578706C696369744C65667402000B4578706C69636974546F7002000D4578706C6963697457696474680301020E4578706C69636974486569676874038F010D506978656C73506572496E636802600A54657874486569676874020D00F10654426576656C05426576656C044C656674024003546F70031B0105576964746803B50106486569676874022D0D4F7267506172656E744E616D65060A57697A617264466F726D0D4E6577506172656E744E616D65060D53656C65637444697250616765055368617065070762734672616D650C4578706C696369744C65667402400B4578706C69636974546F70031B010D4578706C69636974576964746803B5010E4578706C69636974486569676874022D0000F10A544E6577427574746F6E0C43616E63656C427574746F6E044C65667403580203546F7003AB01055769647468024D0648656967687402160C4578706C696369744C6566740358020B4578706C69636974546F7003AB010D4578706C696369745769647468024D0E4578706C6963697448656967687402160000F10A544E6577427574746F6E0A4E657874427574746F6E044C656674037A0103546F7003AB01055769647468024D0648656967687402160C4578706C696369744C656674037A010B4578706C69636974546F7003AB010D4578706C696369745769647468024D0E4578706C6963697448656967687402160000F10A544E6577427574746F6E0A4261636B427574746F6E044C65667403280103546F7003AB01055769647468024D0648656967687402160C4578706C696369744C6566740328010B4578706C69636974546F7003AB010D4578706C696369745769647468024D0E4578706C6963697448656967687402160000F10C544E65774E6F7465626F6F6B0D4F757465724E6F7465626F6F6B044C65667403AB0003546F70023705576964746803070206486569676874036B010C4578706C696369744C65667403AB000B4578706C69636974546F7002370D4578706C6963697457696474680307020E4578706C69636974486569676874036B0100F110544E65774E6F7465626F6F6B506167650B57656C636F6D655061676505436F6C6F72043162AC000D4578706C69636974576964746803F1010E4578706C6963697448656967687403390100F10C544269746D6170496D6167651157697A6172644269746D6170496D61676503546F70023705576964746803AB0006486569676874036B010D4F7267506172656E744E616D65060B57656C636F6D65506167650D4E6577506172656E744E616D65060A57697A617264466F726D0B4578706C69636974546F7002370D4578706C69636974576964746803AB000E4578706C69636974486569676874036B010000F10E544E6577537461746963546578740D57656C636F6D654C6162656C32044C656674023F03546F7003A70005576964746803B50106486569676874024C0A466F6E742E436F6C6F720707636C57686974650A506172656E74466F6E74080C4578706C696369744C656674023F0B4578706C69636974546F7003A7000D4578706C69636974576964746803B5010E4578706C69636974486569676874024C0000F10E544E6577537461746963546578740D57656C636F6D654C6162656C31044C656674023F03546F70027705576964746803B50106486569676874022A0A466F6E742E436F6C6F720707636C57686974650B466F6E742E48656967687402F40C4578706C696369744C656674023F0B4578706C69636974546F7002770D4578706C69636974576964746803B5010E4578706C69636974486569676874022A000000F110544E65774E6F7465626F6F6B5061676509496E6E65725061676505436F6C6F72043162AC000B506172656E74436F6C6F720800F10654426576656C06426576656C310756697369626C65080000F10C544E65774E6F7465626F6F6B0D496E6E65724E6F7465626F6F6B044C656674020003546F7002350557696474680307020648656967687403360105416C69676E0708616C436C69656E74085461624F7264657202000C4578706C696369744C65667402000B4578706C69636974546F7002350D4578706C6963697457696474680307020E4578706C6963697448656967687403360100F110544E65774E6F7465626F6F6B506167650B4C6963656E73655061676500F10F544E6577526164696F427574746F6E174C6963656E73654E6F744163636570746564526164696F044C65667403E60003546F70034C010557696474680396000648656967687402100A466F6E742E436F6C6F720707636C57686974650A506172656E74466F6E74080756697369626C65080C4578706C696369744C65667403E6000B4578706C69636974546F70034C010D4578706C6963697457696474680396000E4578706C6963697448656967687402100000F10F544E6577526164696F427574746F6E144C6963656E73654163636570746564526164696F044C656674024003546F70034C010557696474680396000648656967687402100A466F6E742E436F6C6F720707636C57686974650A506172656E74466F6E74080756697369626C65080C4578706C696369744C65667402400B4578706C69636974546F70034C010D4578706C6963697457696474680396000E4578706C6963697448656967687402100000F10F5452696368456469745669657765720B4C6963656E73654D656D6F044C656674024003546F70023805576964746803B50106486569676874030B010C4578706C696369744C65667402400B4578706C69636974546F7002380D4578706C69636974576964746803B5010E4578706C69636974486569676874030B010000F10E544E6577537461746963546578740D4C6963656E73654C6162656C31044C656674024003546F7002140A466F6E742E436F6C6F720707636C57686974650A506172656E74466F6E74080C4578706C696369744C65667402400B4578706C69636974546F700214000010544E6577436865636B4C697374426F78156E4C6963656E73654163636570746564526164696F044C656674024003546F70034C0105576964746803A6000648656967687402100B426F726465725374796C65070662734E6F6E6505436F6C6F72043162AC000C466F6E742E43686172736574070F44454641554C545F434841525345540A466F6E742E436F6C6F720707636C57686974650B466F6E742E48656967687402F509466F6E742E4E616D6506065461686F6D610A466F6E742E5374796C650B000C4F6E436C69636B436865636B071F6E4C6963656E73654163636570746564526164696F436C69636B436865636B0A506172656E74466F6E74080953686F774C696E657308085461624F7264657202040857616E745461627309000010544E6577436865636B4C697374426F78186E4C6963656E73654E6F744163636570746564526164696F044C65667403E60003546F70034C0105576964746803B6000648656967687402100B426F726465725374796C65070662734E6F6E6505436F6C6F72043162AC000C466F6E742E43686172736574070F44454641554C545F434841525345540A466F6E742E436F6C6F720707636C57686974650B466F6E742E48656967687402F509466F6E742E4E616D6506065461686F6D610A466F6E742E5374796C650B000C4F6E436C69636B436865636B071F6E4C6963656E73654163636570746564526164696F436C69636B436865636B0A506172656E74466F6E74080953686F774C696E657308085461624F7264657202050857616E745461627309000000F110544E65774E6F7465626F6F6B506167650C50617373776F72645061676500F10D5450617373776F7264456469740C50617373776F726445646974044C656674024003546F70026E0557696474680390010C4578706C696369744C65667402400B4578706C69636974546F70026E0D4578706C6963697457696474680390010000F10E544E6577537461746963546578741150617373776F7264456469744C6162656C044C656674024003546F70025A05576964746803B5010A466F6E742E436F6C6F720707636C57686974650A506172656E74466F6E74080C4578706C696369744C65667402400B4578706C69636974546F70025A0D4578706C69636974576964746803B5010000F10E544E6577537461746963546578740D50617373776F72644C6162656C044C656674024003546F70023C05576964746803B50106486569676874020E0A466F6E742E436F6C6F720707636C57686974650A506172656E74466F6E74080C4578706C696369744C65667402400B4578706C69636974546F70023C0D4578706C69636974576964746803B5010E4578706C69636974486569676874020E000000F110544E65774E6F7465626F6F6B506167650E496E666F4265666F72655061676500F10F5452696368456469745669657765720E496E666F4265666F72654D656D6F044C656674024003546F70023805576964746803B5010648656967687403E3000C4578706C696369744C65667402400B4578706C69636974546F7002380D4578706C69636974576964746803B5010E4578706C6963697448656967687403E3000000F10E544E65775374617469635465787414496E666F4265666F7265436C69636B4C6162656C044C656674024003546F70021405576964746803B5010648656967687402180A466F6E742E436F6C6F720707636C57686974650A506172656E74466F6E74080C4578706C696369744C65667402400B4578706C69636974546F7002140D4578706C69636974576964746803B5010E4578706C696369744865696768740218000000F110544E65774E6F7465626F6F6B506167650C55736572496E666F5061676500F108544E6577456469741255736572496E666F53657269616C45646974044C656674024003546F7003B70005576964746803B3010C4578706C696369744C65667402400B4578706C69636974546F7003B7000D4578706C69636974576964746803B3010000F10E544E6577537461746963546578741355736572496E666F53657269616C4C6162656C044C656674024003546F7003A4000557696474680380000A466F6E742E436F6C6F720707636C57686974650A506172656E74466F6E74080C4578706C696369744C65667402400B4578706C69636974546F7003A4000D4578706C6963697457696474680380000000F108544E6577456469740F55736572496E666F4F726745646974044C656674024003546F7003830005576964746803B3010C4578706C696369744C65667402400B4578706C69636974546F700383000D4578706C69636974576964746803B3010000F10E544E6577537461746963546578741055736572496E666F4F72674C6162656C044C656674024003546F7002700557696474680380000A466F6E742E436F6C6F720707636C57686974650A506172656E74466F6E74080C4578706C696369744C65667402400B4578706C69636974546F7002700D4578706C6963697457696474680380000000F108544E6577456469741055736572496E666F4E616D6545646974044C656674024003546F70024F05576964746803B3010C4578706C696369744C65667402400B4578706C69636974546F70024F0D4578706C69636974576964746803B3010000F10E544E6577537461746963546578741155736572496E666F4E616D654C6162656C044C656674024003546F70023C0557696474680380000A466F6E742E436F6C6F720707636C57686974650A506172656E74466F6E74080C4578706C696369744C65667402400B4578706C69636974546F70023C0D4578706C696369745769647468038000000000F110544E65774E6F7465626F6F6B506167650D53656C656374446972506167650D4578706C6963697457696474680307020E4578706C69636974486569676874036B0100F10C544269746D6170496D6167651453656C6563744469724269746D6170496D6167650648656967687402000756697369626C65080E4578706C6963697448656967687402000000F10E544E6577537461746963546578740E4469736B53706163654C6162656C044C656674024803546F700315010557696474680258084175746F53697A650908576F726457726170080743617074696F6E061244657374696E6174696F6E20466F6C6465720A466F6E742E436F6C6F720707636C57686974650A506172656E74466F6E74080C4578706C696369744C65667402480B4578706C69636974546F700315010D4578706C69636974576964746802580000F10A544E6577427574746F6E0F44697242726F777365427574746F6E044C65667403A40103546F70032801055769647468024D0C4578706C696369744C65667403A4010B4578706C69636974546F700328010D4578706C696369745769647468024D0000F10554456469740744697245646974044C656674024803546F70032C0105576964746803590106486569676874020E0A4175746F53656C656374080B426F726465725374796C65070662734E6F6E650A466F6E742E436F6C6F720707636C57686974650B506172656E74436F6C6F72090A506172656E74466F6E74080C4578706C696369744C65667402480B4578706C69636974546F70032C010D4578706C6963697457696474680359010E4578706C69636974486569676874020E0000F10E544E6577537461746963546578741453656C65637444697242726F7773654C6162656C044C656674024005576964746803B3010648656967687402180A466F6E742E436F6C6F720707636C57686974650A506172656E74466F6E74080C4578706C696369744C65667402400D4578706C69636974576964746803B3010E4578706C6963697448656967687402180000F10E544E6577537461746963546578740E53656C6563744469724C6162656C044C656674024003546F70021405576964746803B5010648656967687402180A466F6E742E436F6C6F720707636C57686974650A506172656E74466F6E74080C4578706C696369744C65667402400B4578706C69636974546F7002140D4578706C69636974576964746803B5010E4578706C696369744865696768740218000000F110544E65774E6F7465626F6F6B506167651453656C656374436F6D706F6E656E74735061676500F10E544E65775374617469635465787418436F6D706F6E656E74734469736B53706163654C6162656C044C656674024003546F7003400105576964746803B5010648656967687402180A466F6E742E436F6C6F720707636C57686974650A506172656E74466F6E74080C4578706C696369744C65667402400B4578706C69636974546F700340010D4578706C69636974576964746803B5010E4578706C6963697448656967687402180000F110544E6577436865636B4C697374426F780E436F6D706F6E656E74734C697374044C656674024003546F70025005576964746803B5010648656967687403E3000C4578706C696369744C65667402400B4578706C69636974546F7002500D4578706C69636974576964746803B5010E4578706C6963697448656967687403E3000000F10C544E6577436F6D626F426F780A5479706573436F6D626F044C656674024003546F70023805576964746803B5010C4578706C696369744C65667402400B4578706C69636974546F7002380D4578706C69636974576964746803B5010000F10E544E6577537461746963546578741553656C656374436F6D706F6E656E74734C6162656C044C656674024003546F70021405576964746803B5010648656967687402180A466F6E742E436F6C6F720707636C57686974650A506172656E74466F6E74080C4578706C696369744C65667402400B4578706C69636974546F7002140D4578706C69636974576964746803B5010E4578706C696369744865696768740218000000F110544E65774E6F7465626F6F6B506167651653656C65637450726F6772616D47726F75705061676500F10C544269746D6170496D6167651653656C65637447726F75704269746D6170496D6167650648656967687402000756697369626C65080E4578706C6963697448656967687402000000F10C544E6577436865636B426F780C4E6F49636F6E73436865636B044C656674024003546F700397000557696474680339010A466F6E742E436F6C6F720707636C57686974650A506172656E74466F6E74080C4578706C696369744C65667402400B4578706C69636974546F700397000D4578706C6963697457696474680339010000F10A544E6577427574746F6E1147726F757042726F777365427574746F6E044C656674039E0103546F700277055769647468024D0C4578706C696369744C656674039E010B4578706C69636974546F7002770D4578706C696369745769647468024D0000F108544E6577456469740947726F757045646974044C656674024003546F7002780557696474680357010C4578706C696369744C65667402400B4578706C69636974546F7002780D4578706C6963697457696474680357010000F10E544E6577537461746963546578742053656C65637453746172744D656E75466F6C64657242726F7773654C6162656C044C656674024003546F70026405576964746803B5010A466F6E742E436F6C6F720707636C57686974650A506172656E74466F6E74080C4578706C696369744C65667402400B4578706C69636974546F7002640D4578706C69636974576964746803B5010000F10E544E6577537461746963546578741A53656C65637453746172744D656E75466F6C6465724C6162656C044C656674024003546F70021405576964746803B5010648656967687402240A466F6E742E436F6C6F720707636C57686974650A506172656E74466F6E74080C4578706C696369744C65667402400B4578706C69636974546F7002140D4578706C69636974576964746803B5010E4578706C696369744865696768740224000000F110544E65774E6F7465626F6F6B506167650F53656C6563745461736B735061676500F110544E6577436865636B4C697374426F78095461736B734C697374044C656674024003546F70023505576964746803AE0106486569676874032C0105436F6C6F72043162AC000A466F6E742E436F6C6F720707636C57686974650A506172656E74466F6E74080C4578706C696369744C65667402400B4578706C69636974546F7002350D4578706C69636974576964746803AE010E4578706C69636974486569676874032C010000F10E544E6577537461746963546578741053656C6563745461736B734C6162656C044C656674024003546F70021405576964746803B5010648656967687402180A466F6E742E436F6C6F720707636C57686974650A506172656E74466F6E74080C4578706C696369744C65667402400B4578706C69636974546F7002140D4578706C69636974576964746803B5010E4578706C696369744865696768740218000000F110544E65774E6F7465626F6F6B506167650952656164795061676500F108544E65774D656D6F0952656164794D656D6F044C656674024003546F70022B05576964746803B501064865696768740322010C4578706C696369744C65667402400B4578706C69636974546F70022B0D4578706C69636974576964746803B5010E4578706C696369744865696768740322010000F10E544E6577537461746963546578740A52656164794C6162656C044C656674024003546F70021405576964746803B5010A466F6E742E436F6C6F720707636C57686974650A506172656E74466F6E74080C4578706C696369744C65667402400B4578706C69636974546F7002140D4578706C69636974576964746803B501000000F110544E65774E6F7465626F6F6B506167650D507265706172696E675061676500F10C544269746D6170496D61676519507265706172696E674572726F724269746D6170496D616765044C656674022803546F700214105265706C61636557697468436F6C6F72043162AC000C4578706C696369744C65667402280B4578706C69636974546F7002140000F10E544E6577537461746963546578740E507265706172696E674C6162656C044C656674024003546F7002140A466F6E742E436F6C6F720707636C57686974650A506172656E74466F6E74080C4578706C696369744C65667402400B4578706C69636974546F7002140000F10F544E6577526164696F427574746F6E11507265706172696E67596573526164696F044C656674024003546F70038D000A466F6E742E436F6C6F720707636C57686974650A506172656E74466F6E74080C4578706C696369744C65667402400B4578706C69636974546F70038D000000F10F544E6577526164696F427574746F6E10507265706172696E674E6F526164696F044C656674024003546F7003A3000A466F6E742E436F6C6F720707636C57686974650A506172656E74466F6E74080C4578706C696369744C65667402400B4578706C69636974546F7003A300000000F110544E65774E6F7465626F6F6B506167650E496E7374616C6C696E675061676500F10E544E6577537461746963546578740D46696C656E616D654C6162656C044C656674024003546F70023C05576964746803B50106486569676874021B0A466F6E742E436F6C6F720707636C57686974650A506172656E74466F6E74080C4578706C696369744C65667402400B4578706C69636974546F70023C0D4578706C69636974576964746803B5010E4578706C69636974486569676874021B0000F10E544E6577537461746963546578740B5374617475734C6162656C044C656674024003546F70021805576964746803B50106486569676874020E0A466F6E742E436F6C6F720707636C57686974650A506172656E74466F6E74080C4578706C696369744C65667402400B4578706C69636974546F7002180D4578706C69636974576964746803B5010E4578706C69636974486569676874020E0000F10F544E657750726F67726573734261720D50726F67726573734761756765044C656674024003546F70025A05576964746803AE010648656967687402140C4578706C696369744C65667402400B4578706C69636974546F70025A0D4578706C69636974576964746803AE010E4578706C696369744865696768740214000000F110544E65774E6F7465626F6F6B506167650D496E666F41667465725061676500F10F5452696368456469745669657765720D496E666F41667465724D656D6F044C656674024003546F70023805576964746803B5010648656967687403E3000C4578706C696369744C65667402400B4578706C69636974546F7002380D4578706C69636974576964746803B5010E4578706C6963697448656967687403E3000000F10E544E65775374617469635465787413496E666F4166746572436C69636B4C6162656C044C656674024003546F70021405576964746803B5010648656967687402180A466F6E742E436F6C6F720707636C57686974650A506172656E74466F6E74080C4578706C696369744C65667402400B4578706C69636974546F7002140D4578706C69636974576964746803B5010E4578706C69636974486569676874021800000000F1065450616E656C094D61696E50616E656C0557696474680307020648656967687402350D4F7267506172656E744E616D650609496E6E6572506167650D4E6577506172656E744E616D65060A57697A617264466F726D05416C69676E0705616C546F7005436F6C6F720400336600085461624F7264657202010D4578706C6963697457696474680307020E4578706C69636974486569676874023500F10C544269746D6170496D6167651657697A617264536D616C6C4269746D6170496D616765044C656674020003546F7003A20105576964746803B2020648656967687402290D4F7267506172656E744E616D6506094D61696E50616E656C0D4E6577506172656E744E616D65060A57697A617264466F726D05416C69676E0708616C426F74746F6D0C4578706C696369744C65667402000B4578706C69636974546F7003A2010D4578706C69636974576964746803B2020E4578706C6963697448656967687402290000F10E544E65775374617469635465787414506167654465736372697074696F6E4C6162656C044C656674021E03546F700218055769647468036E010A466F6E742E436F6C6F720707636C57686974650A506172656E74466F6E74080C4578706C696369744C656674021E0B4578706C69636974546F7002180D4578706C696369745769647468036E010000F10E544E6577537461746963546578740D506167654E616D654C6162656C044C656674021103546F700205055769647468037C0106486569676874020C0A466F6E742E436F6C6F720707636C57686974650C4578706C696369744C65667402110B4578706C69636974546F7002050D4578706C696369745769647468037C010E4578706C69636974486569676874020C00000000F110544E65774E6F7465626F6F6B506167650C46696E69736865645061676505436F6C6F72043162AC0000F10C544269746D6170496D6167651257697A6172644269746D6170496D6167653203546F70023505576964746803B2020648656967687402020D4F7267506172656E744E616D65060C46696E6973686564506167650D4E6577506172656E744E616D65060A57697A617264466F726D0A4269746D617046696C65060B746F706C696E652E626D700B4578706C69636974546F7002350D4578706C69636974576964746803B2020E4578706C6963697448656967687402020000F110544E6577436865636B4C697374426F780752756E4C697374044C656674024003546F70039E00055769647468039D010A466F6E742E436F6C6F720707636C57686974650A506172656E74466F6E74080C4578706C696369744C65667402400B4578706C69636974546F70039E000D4578706C696369745769647468039D010000F10F544E6577526164696F427574746F6E074E6F526164696F044C656674024003546F7003B8000A466F6E742E436F6C6F720707636C57686974650A506172656E74466F6E74080C4578706C696369744C65667402400B4578706C69636974546F7003B8000000F10F544E6577526164696F427574746F6E08596573526164696F044C656674024003546F7003A2000A466F6E742E436F6C6F720707636C57686974650A506172656E74466F6E74080C4578706C696369744C65667402400B4578706C69636974546F7003A2000000F10E544E6577537461746963546578740D46696E69736865644C6162656C044C656674024003546F70023C05576964746803B5010648656967687402560A466F6E742E436F6C6F720707636C57686974650A506172656E74466F6E74080C4578706C696369744C65667402400B4578706C69636974546F70023C0D4578706C69636974576964746803B5010E4578706C6963697448656967687402560000F10E544E6577537461746963546578741446696E697368656448656164696E674C6162656C044C656674024003546F70021405576964746803B5010648656967687402180A466F6E742E436F6C6F720707636C57686974650B466F6E742E48656967687402F40C4578706C696369744C65667402400B4578706C69636974546F7002140D4578706C69636974576964746803B5010E4578706C6963697448656967687402180000000000

[Code]
{ RedesignWizardFormBegin } // �� ������� ��� ������!
// �� �������� ��� ������. ��� ������� �������������.
var
  nLicenseAcceptedRadio: TNewCheckListBox;
  nLicenseNotAcceptedRadio: TNewCheckListBox;

procedure nLicenseAcceptedRadioClickCheck(Sender: TObject); forward;

procedure RedesignWizardForm;
begin
  with WizardForm do
  begin
    Color := 11297329;
    AutoScroll := False;
    ClientHeight := ScaleY(459);
    ClientWidth := ScaleX(690);
  end;

  with WizardForm.Bevel do
  begin
    Left := ScaleX(64);
    Top := ScaleY(283);
    Width := ScaleX(437);
    Height := ScaleY(45);
    Parent := WizardForm.SelectDirPage;
    Shape := bsFrame;
  end;

  with WizardForm.CancelButton do
  begin
    Left := ScaleX(600);
    Top := ScaleY(427);
    Width := ScaleX(77);
    Height := ScaleY(22);
  end;

  with WizardForm.NextButton do
  begin
    Left := ScaleX(378);
    Top := ScaleY(427);
    Width := ScaleX(77);
    Height := ScaleY(22);
  end;

  with WizardForm.BackButton do
  begin
    Left := ScaleX(296);
    Top := ScaleY(427);
    Width := ScaleX(77);
    Height := ScaleY(22);
  end;

  with WizardForm.OuterNotebook do
  begin
    Left := ScaleX(171);
    Top := ScaleY(55);
    Width := ScaleX(519);
    Height := ScaleY(363);
  end;

  with WizardForm.WelcomePage do
  begin
    Color := 11297329;
  end;

  with WizardForm.WizardBitmapImage do
  begin
    Top := ScaleY(55);
    Width := ScaleX(171);
    Height := ScaleY(363);
    Parent := WizardForm;
  end;

  with WizardForm.WelcomeLabel2 do
  begin
    Font.Color := clWhite;
    ParentFont := False;
    Left := ScaleX(63);
    Top := ScaleY(167);
    Width := ScaleX(437);
    Height := ScaleY(76);
  end;

  with WizardForm.WelcomeLabel1 do
  begin
    Font.Color := clWhite;
    Font.Height := -12;
    Left := ScaleX(63);
    Top := ScaleY(119);
    Width := ScaleX(437);
    Height := ScaleY(42);
  end;

  with WizardForm.InnerPage do
  begin
    Color := 11297329;
  end;

  with WizardForm.Bevel1 do
  begin
    Visible := False;
  end;

  with WizardForm.InnerNotebook do
  begin
    Left := ScaleX(0);
    Top := ScaleY(53);
    Width := ScaleX(519);
    Height := ScaleY(310);
    Align := alClient;
  end;

  with WizardForm.LicenseNotAcceptedRadio do
  begin
    Left := ScaleX(230);
    Top := ScaleY(332);
    Width := ScaleX(150);
    Height := ScaleY(16);
    Font.Color := clWhite;
    ParentFont := False;
    Visible := False;
  end;

  with WizardForm.LicenseAcceptedRadio do
  begin
    Left := ScaleX(64);
    Top := ScaleY(332);
    Width := ScaleX(150);
    Height := ScaleY(16);
    Font.Color := clWhite;
    ParentFont := False;
    Visible := False;
  end;

  with WizardForm.LicenseMemo do
  begin
    Left := ScaleX(64);
    Top := ScaleY(56);
    Width := ScaleX(437);
    Height := ScaleY(267);
  end;

  with WizardForm.LicenseLabel1 do
  begin
    Font.Color := clWhite;
    ParentFont := False;
    Left := ScaleX(64);
    Top := ScaleY(20);
  end;

  { nLicenseAcceptedRadio }
  nLicenseAcceptedRadio := TNewCheckListBox.Create(WizardForm);
  with nLicenseAcceptedRadio do
  begin
    Parent := WizardForm.LicensePage;
    Left := ScaleX(64);
    Top := ScaleY(332);
    Width := ScaleX(166);
    Height := ScaleY(16);
    BorderStyle := bsNone;
    Color := 11297329;
    Font.Color := clWhite;
    Font.Height := -11;
    Font.Name := 'Tahoma';
    Font.Style := [];
    OnClickCheck := @nLicenseAcceptedRadioClickCheck;
    ParentFont := False;
    ShowLines := False;
    WantTabs := True;
  end;

  { nLicenseNotAcceptedRadio }
  nLicenseNotAcceptedRadio := TNewCheckListBox.Create(WizardForm);
  with nLicenseNotAcceptedRadio do
  begin
    Parent := WizardForm.LicensePage;
    Left := ScaleX(230);
    Top := ScaleY(332);
    Width := ScaleX(182);
    Height := ScaleY(16);
    BorderStyle := bsNone;
    Color := 11297329;
    Font.Color := clWhite;
    Font.Height := -11;
    Font.Name := 'Tahoma';
    Font.Style := [];
    OnClickCheck := @nLicenseAcceptedRadioClickCheck;
    ParentFont := False;
    ShowLines := False;
    WantTabs := True;
  end;

  nLicenseAcceptedRadio.TabOrder := 4;
  nLicenseNotAcceptedRadio.TabOrder := 5;

  with WizardForm.PasswordEdit do
  begin
    Left := ScaleX(64);
    Top := ScaleY(110);
    Width := ScaleX(400);
  end;

  with WizardForm.PasswordEditLabel do
  begin
    Font.Color := clWhite;
    ParentFont := False;
    Left := ScaleX(64);
    Top := ScaleY(90);
    Width := ScaleX(437);
  end;

  with WizardForm.PasswordLabel do
  begin
    Font.Color := clWhite;
    ParentFont := False;
    Left := ScaleX(64);
    Top := ScaleY(60);
    Width := ScaleX(437);
    Height := ScaleY(14);
  end;

  with WizardForm.InfoBeforeMemo do
  begin
    Left := ScaleX(64);
    Top := ScaleY(56);
    Width := ScaleX(437);
    Height := ScaleY(227);
  end;

  with WizardForm.InfoBeforeClickLabel do
  begin
    Font.Color := clWhite;
    ParentFont := False;
    Left := ScaleX(64);
    Top := ScaleY(20);
    Width := ScaleX(437);
    Height := ScaleY(24);
  end;

  with WizardForm.UserInfoSerialEdit do
  begin
    Left := ScaleX(64);
    Top := ScaleY(183);
    Width := ScaleX(435);
  end;

  with WizardForm.UserInfoSerialLabel do
  begin
    Font.Color := clWhite;
    ParentFont := False;
    Left := ScaleX(64);
    Top := ScaleY(164);
    Width := ScaleX(128);
  end;

  with WizardForm.UserInfoOrgEdit do
  begin
    Left := ScaleX(64);
    Top := ScaleY(131);
    Width := ScaleX(435);
  end;

  with WizardForm.UserInfoOrgLabel do
  begin
    Font.Color := clWhite;
    ParentFont := False;
    Left := ScaleX(64);
    Top := ScaleY(112);
    Width := ScaleX(128);
  end;

  with WizardForm.UserInfoNameEdit do
  begin
    Left := ScaleX(64);
    Top := ScaleY(79);
    Width := ScaleX(435);
  end;

  with WizardForm.UserInfoNameLabel do
  begin
    Font.Color := clWhite;
    ParentFont := False;
    Left := ScaleX(64);
    Top := ScaleY(60);
    Width := ScaleX(128);
  end;

  with WizardForm.SelectDirBitmapImage do
  begin
    Height := ScaleY(0);
    Visible := False;
  end;

  with WizardForm.DiskSpaceLabel do
  begin
    AutoSize := True;
    WordWrap := False;
    Caption := 'Destination Folder';
    Font.Color := clWhite;
    ParentFont := False;
    Left := ScaleX(72);
    Top := ScaleY(277);
    Width := ScaleX(88);
  end;

  with WizardForm.DirBrowseButton do
  begin
    Left := ScaleX(420);
    Top := ScaleY(296);
    Width := ScaleX(77);
  end;

  with WizardForm.DirEdit do
  begin
    Left := ScaleX(72);
    Top := ScaleY(300);
    Width := ScaleX(345);
    Height := ScaleY(14);
    AutoSelect := False;
    BorderStyle := bsNone;
    Font.Color := clWhite;
    ParentColor := True;
    ParentFont := False;
  end;

  with WizardForm.SelectDirBrowseLabel do
  begin
    Font.Color := clWhite;
    ParentFont := False;
    Left := ScaleX(64);
    Width := ScaleX(435);
    Height := ScaleY(24);
  end;

  with WizardForm.SelectDirLabel do
  begin
    Font.Color := clWhite;
    ParentFont := False;
    Left := ScaleX(64);
    Top := ScaleY(20);
    Width := ScaleX(437);
    Height := ScaleY(24);
  end;

  with WizardForm.ComponentsDiskSpaceLabel do
  begin
    Font.Color := clWhite;
    ParentFont := False;
    Left := ScaleX(64);
    Top := ScaleY(320);
    Width := ScaleX(437);
    Height := ScaleY(24);
  end;

  with WizardForm.ComponentsList do
  begin
    Left := ScaleX(64);
    Top := ScaleY(80);
    Width := ScaleX(437);
    Height := ScaleY(227);
  end;

  with WizardForm.TypesCombo do
  begin
    Left := ScaleX(64);
    Top := ScaleY(56);
    Width := ScaleX(437);
  end;

  with WizardForm.SelectComponentsLabel do
  begin
    Font.Color := clWhite;
    ParentFont := False;
    Left := ScaleX(64);
    Top := ScaleY(20);
    Width := ScaleX(437);
    Height := ScaleY(24);
  end;

  with WizardForm.SelectGroupBitmapImage do
  begin
    Height := ScaleY(0);
    Visible := False;
  end;

  with WizardForm.NoIconsCheck do
  begin
    Left := ScaleX(64);
    Top := ScaleY(151);
    Width := ScaleX(313);
    Font.Color := clWhite;
    ParentFont := False;
  end;

  with WizardForm.GroupBrowseButton do
  begin
    Left := ScaleX(414);
    Top := ScaleY(119);
    Width := ScaleX(77);
  end;

  with WizardForm.GroupEdit do
  begin
    Left := ScaleX(64);
    Top := ScaleY(120);
    Width := ScaleX(343);
  end;

  with WizardForm.SelectStartMenuFolderBrowseLabel do
  begin
    Font.Color := clWhite;
    ParentFont := False;
    Left := ScaleX(64);
    Top := ScaleY(100);
    Width := ScaleX(437);
  end;

  with WizardForm.SelectStartMenuFolderLabel do
  begin
    Font.Color := clWhite;
    ParentFont := False;
    Left := ScaleX(64);
    Top := ScaleY(20);
    Width := ScaleX(437);
    Height := ScaleY(36);
  end;

  with WizardForm.TasksList do
  begin
    Left := ScaleX(64);
    Top := ScaleY(53);
    Width := ScaleX(430);
    Height := ScaleY(300);
    Color := 11297329;
    Font.Color := clWhite;
    ParentFont := False;
  end;

  with WizardForm.SelectTasksLabel do
  begin
    Font.Color := clWhite;
    ParentFont := False;
    Left := ScaleX(64);
    Top := ScaleY(20);
    Width := ScaleX(437);
    Height := ScaleY(24);
  end;

  with WizardForm.ReadyMemo do
  begin
    Left := ScaleX(64);
    Top := ScaleY(43);
    Width := ScaleX(437);
    Height := ScaleY(290);
  end;

  with WizardForm.ReadyLabel do
  begin
    Font.Color := clWhite;
    ParentFont := False;
    Left := ScaleX(64);
    Top := ScaleY(20);
    Width := ScaleX(437);
  end;

  with WizardForm.PreparingErrorBitmapImage do
  begin
    Left := ScaleX(40);
    Top := ScaleY(20);
    ReplaceWithColor := 11297329;
  end;

  with WizardForm.PreparingLabel do
  begin
    Font.Color := clWhite;
    ParentFont := False;
    Left := ScaleX(64);
    Top := ScaleY(20);
  end;

  with WizardForm.PreparingYesRadio do
  begin
    Left := ScaleX(64);
    Top := ScaleY(141);
    Font.Color := clWhite;
    ParentFont := False;
  end;

  with WizardForm.PreparingNoRadio do
  begin
    Left := ScaleX(64);
    Top := ScaleY(163);
    Font.Color := clWhite;
    ParentFont := False;
  end;

  with WizardForm.FilenameLabel do
  begin
    Font.Color := clWhite;
    ParentFont := False;
    Left := ScaleX(64);
    Top := ScaleY(60);
    Width := ScaleX(437);
    Height := ScaleY(27);
  end;

  with WizardForm.StatusLabel do
  begin
    Font.Color := clWhite;
    ParentFont := False;
    Left := ScaleX(64);
    Top := ScaleY(24);
    Width := ScaleX(437);
    Height := ScaleY(14);
  end;

  with WizardForm.ProgressGauge do
  begin
    Left := ScaleX(64);
    Top := ScaleY(90);
    Width := ScaleX(430);
    Height := ScaleY(20);
  end;

  with WizardForm.InfoAfterMemo do
  begin
    Left := ScaleX(64);
    Top := ScaleY(56);
    Width := ScaleX(437);
    Height := ScaleY(227);
  end;

  with WizardForm.InfoAfterClickLabel do
  begin
    Font.Color := clWhite;
    ParentFont := False;
    Left := ScaleX(64);
    Top := ScaleY(20);
    Width := ScaleX(437);
    Height := ScaleY(24);
  end;

  with WizardForm.MainPanel do
  begin
    Width := ScaleX(519);
    Height := ScaleY(53);
    Parent := WizardForm;
    Align := alTop;
    Color := 6697728;
  end;

  with WizardForm.WizardSmallBitmapImage do
  begin
    Left := ScaleX(0);
    Top := ScaleY(418);
    Width := ScaleX(690);
    Height := ScaleY(41);
    Parent := WizardForm;
    Align := alBottom;
  end;

  with WizardForm.PageDescriptionLabel do
  begin
    Font.Color := clWhite;
    ParentFont := False;
    Left := ScaleX(30);
    Top := ScaleY(24);
    Width := ScaleX(366);
  end;

  with WizardForm.PageNameLabel do
  begin
    Font.Color := clWhite;
    Left := ScaleX(17);
    Top := ScaleY(5);
    Width := ScaleX(380);
    Height := ScaleY(12);
  end;

  WizardForm.InnerNotebook.TabOrder := 0;
  WizardForm.MainPanel.TabOrder := 1;

  with WizardForm.FinishedPage do
  begin
    Color := 11297329;
  end;

  with WizardForm.WizardBitmapImage2 do
  begin
    Top := ScaleY(53);
    Width := ScaleX(690);
    Height := ScaleY(2);
    Parent := WizardForm;
    ExtractTemporaryFile('WizardForm.WizardBitmapImage2.bmp');
    Bitmap.LoadFromFile(ExpandConstant('{tmp}\WizardForm.WizardBitmapImage2.bmp'));
  end;

  with WizardForm.RunList do
  begin
    Left := ScaleX(64);
    Top := ScaleY(158);
    Width := ScaleX(413);
    Font.Color := clWhite;
    ParentFont := False;
  end;

  with WizardForm.NoRadio do
  begin
    Left := ScaleX(64);
    Top := ScaleY(184);
    Font.Color := clWhite;
    ParentFont := False;
  end;

  with WizardForm.YesRadio do
  begin
    Left := ScaleX(64);
    Top := ScaleY(162);
    Font.Color := clWhite;
    ParentFont := False;
  end;

  with WizardForm.FinishedLabel do
  begin
    Font.Color := clWhite;
    ParentFont := False;
    Left := ScaleX(64);
    Top := ScaleY(60);
    Width := ScaleX(437);
    Height := ScaleY(86);
  end;

  with WizardForm.FinishedHeadingLabel do
  begin
    Font.Color := clWhite;
    Font.Height := -12;
    Left := ScaleX(64);
    Top := ScaleY(20);
    Width := ScaleX(437);
    Height := ScaleY(24);
  end;

{ ReservationBegin }
  // This part is for you. Add your specialized code here.
  nLicenseAcceptedRadio.AddRadioButton(WizardForm.LicenseAcceptedRadio.Caption, '', 0, False, True, nil);
  nLicenseNotAcceptedRadio.AddRadioButton(WizardForm.LicenseNotAcceptedRadio.Caption, '', 0, True, True, nil);
  WizardForm.Center;
{ ReservationEnd }
end;
// �� �������� ��� ������. ��� ������� �������������.
{ RedesignWizardFormEnd } // �� ������� ��� ������!

procedure nLicenseAcceptedRadioClickCheck(Sender: TObject);
begin
  if Sender = nLicenseAcceptedRadio then
  begin
    WizardForm.LicenseAcceptedRadio.Checked := True;
    nLicenseNotAcceptedRadio.Items.Clear;
    nLicenseNotAcceptedRadio.AddRadioButton(WizardForm.LicenseNotAcceptedRadio.Caption, '', 0, False, True, nil);
  end else if Sender = nLicenseNotAcceptedRadio then
  begin
    WizardForm.LicenseNotAcceptedRadio.Checked := True;
    nLicenseAcceptedRadio.Items.Clear;
    nLicenseAcceptedRadio.AddRadioButton(WizardForm.LicenseAcceptedRadio.Caption, '', 0, False, True, nil);
  end;
end;

procedure InitializeWizard();
begin
  RedesignWizardForm;
end;

function CheckSerial(Serial: String): Boolean;
begin
  Result := Serial = '123456';
end;





