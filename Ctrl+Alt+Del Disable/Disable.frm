VERSION 5.00
Begin VB.Form Form1 
   BorderStyle     =   4  'Fixed ToolWindow
   Caption         =   "   [-Ctrl+Alt+Delete-]"
   ClientHeight    =   825
   ClientLeft      =   45
   ClientTop       =   315
   ClientWidth     =   2055
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   825
   ScaleWidth      =   2055
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton Enable 
      Caption         =   "Enable"
      Enabled         =   0   'False
      Height          =   255
      Left            =   1080
      TabIndex        =   2
      Top             =   120
      Width           =   855
   End
   Begin VB.CommandButton Disable 
      Caption         =   "Disable"
      Height          =   255
      Left            =   120
      TabIndex        =   1
      Top             =   120
      Width           =   855
   End
   Begin VB.CommandButton Exit 
      Caption         =   "EXIT"
      Height          =   255
      Left            =   120
      TabIndex        =   0
      Top             =   480
      Width           =   1815
   End
   Begin VB.Timer TmrDisable 
      Enabled         =   0   'False
      Interval        =   100
      Left            =   2400
      Top             =   2040
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Declare Function FindWindow Lib "user32" Alias "FindWindowA" (ByVal lpClassName As String, ByVal lpWindowName As String) As Long
Private Declare Function PostMessage Lib "user32" Alias "PostMessageA" (ByVal hwnd As Long, ByVal wMsg As Long, ByVal wParam As Long, lParam As Any) As Long
Const WM_CLOSE = &H10

Private Sub Disable_Click()
Enable.Enabled = True
Disable.Enabled = False
TmrDisable.Enabled = True
End Sub

Private Sub Enable_Click()
Enable.Enabled = False
Disable.Enabled = True
TmrDisable.Enabled = False
End Sub

Private Sub Exit_Click()
Unload Me
End
End Sub

Private Sub TmrDisable_Timer()
Const WM_CLOSE = &H10
Dim winHwnd As Long
Dim RetVal As Long
winHwnd = FindWindow(vbNullString, "Windows Task Manager")
If winHwnd <> 0 Then
PostMessage winHwnd, WM_CLOSE, 0&, 0&
Else
End If
End Sub
