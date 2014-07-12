%%
%% This is file `trtthesis.cls',
%% This contains add-ons for tutthesis.cls file by Sami Paavilainen.
%% Author: Samuli Hirvonen (March 2014)
%% --------------------------------------------------------------
%%
%% It may be distributed and/or modified under the
%% conditions of the LaTeX Project Public License, either version 1.3
%% of this license or (at your option) any later version.
%% The latest version of this license is in
%%    http://www.latex-project.org/lppl.txt
%% and version 1.3 or later is part of all distributions of LaTeX
%% version 2003/12/01 or later.
%%
%% This is a Derived Work from the Work tutthesis.cls that is available at
%%    http://www.tut.fi/pop/opiskelu/opinnaytetyot/latex/tutthesis.cls
%% and is also included in this repository.

\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{vendor/trtthesis}
              [2006/10/16 v0.1f
 Extension to LaTeX report document class]

\LoadClassWithOptions{report}

% ------------
% Typography
%
% Headings : TEX Gyre Heros
% Copy     : Times
% ------------
\usepackage{tgheros}
\usepackage{mathptmx}

% -----------
% Line height
% -----------
\usepackage{setspace}
\setstretch{1.2}

% -----------
% Table of contents
% -----------
\renewcommand\contentsname{Sisällys} % Sisällysluettelon nimi

% Chapters that don't have numbering but are wanted to
% show up in Table of Contents are marked with \nnchapter
\newcommand{\nnchapter}[1]{
    \chapter*{#1}
    \addcontentsline{toc}{chapter}{\MakeUppercase#1}
}

\renewcommand\tableofcontents{%
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \nnchapter{\contentsname
        \@mkboth{%
           \MakeUppercase\contentsname}{\MakeUppercase\contentsname}}%
    \@starttoc{toc}%
    \if@restonecol\twocolumn\fi
}

\renewcommand\@dotsep{0}
%\newcommand*\l@appendix{\@dottedtocline{1}{0.0em}{3.8em}}
\renewcommand*\l@chapter{\@dottedtocline{1}{0.0em}{1.5em}} % kommentoituna hyvä
\renewcommand*\l@subsection{\@dottedtocline{2}{2.5em}{3.2em}}
\renewcommand*\l@subsubsection{\@dottedtocline{3}{6.5em}{4.1em}}
\renewcommand*\l@paragraph{\@dottedtocline{4}{9.5em}{5em}}
\renewcommand*\l@subparagraph{\@dottedtocline{5}{11.5em}{6em}}

\renewcommand*\l@chapter[2]{
    \addpenalty{-\@highpenalty}%
    \vskip 0.4em \@plus\p@
    \setlength\@tempdima{2.5em}%
    \begingroup
      \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      \leavevmode
      \textbf{\textsf{\uppercase{#1}\nobreak\leaders\hbox{$\m@th
        	\mkern \@dotsep mu\hbox{.}\mkern \@dotsep
        mu$}
        \hfill\nobreak\hb@xt@\@pnumwidth{\hss #2}}}\par
      \penalty\@highpenalty
    \endgroup
    \vskip 0.4em \@plus\p@
}

\renewcommand*\l@section[2]{%
    \addpenalty{-\@highpenalty}%
    \vskip 0.1em \@plus\p@
    \setlength\@tempdima{2.5em}%
    \begingroup
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      \leavevmode
      \advance\leftskip\@tempdima
      \hskip -\leftskip
      \hskip 2.5em
      \textsf{#1 \leaders\hbox{\rule{2pt}{0.5pt}}\hfill \hb@xt@\@pnumwidth{\hss #2}}\par
      \penalty\@highpenalty
    \endgroup
    \vskip 0.1em \@plus\p@
}

\renewcommand*\l@subsection[2]{%
    \addpenalty{-\@highpenalty}%
    \vskip 0.1em \@plus\p@
    \setlength\@tempdima{2.5em}%
    \begingroup
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      \leavevmode
      \advance\leftskip\@tempdima
      \hskip -\leftskip
      \hskip 5em
      \textsf{#1 \leaders\hbox{\rule{2pt}{0.5pt}}\hfill \hb@xt@\@pnumwidth{\hss #2}}\par
      \penalty\@highpenalty
    \endgroup
    \vskip 0.1em \@plus\p@
}

% ----------

\if@twoside
  \def\ps@headings{%
      \let\@oddfoot\@empty\let\@evenfoot\@empty
      \def\@evenhead{\thepage\hfil\slshape\leftmark}%
      \def\@oddhead{{\slshape\rightmark}\hfil\thepage}%
      \let\@mkboth\markboth
    \def\chaptermark##1{%
      \markboth {\MakeUppercase{%
        \ifnum \c@secnumdepth >\m@ne
            \@chapapp\ \tutchapter. \ %
        \fi
        ##1}}{}}%
    \def\sectionmark##1{%
      \markright {\MakeUppercase{%
        \ifnum \c@secnumdepth >\z@
          \thesection. \ %
        \fi
        ##1}}}}
\else
  \def\ps@headings{%
    \let\@oddfoot\@empty
    \def\@oddhead{{\slshape\rightmark}\hfil\thepage}%
    \let\@mkboth\markboth
    \def\chaptermark##1{%
      \markright {\MakeUppercase{%
        \ifnum \c@secnumdepth >\m@ne
            \@chapapp\ \tutchapter \ %
        \fi
        ##1}}}}
\fi

\newcommand\chaptertocstyle{chapter}
\newcommand\chaptertocstr{\thechapter.}
\newcommand\tutchapter{\thechapter.}
\renewcommand\thechapter {\@arabic\c@chapter}
\renewcommand\thesection {\thechapter.\@arabic\c@section}
\renewcommand\thesubsection   {\thesection.\@arabic\c@subsection}
\renewcommand\thesubsubsection{\thesubsection \.@arabic\c@subsubsection}
\renewcommand\theparagraph    {\thesubsubsection.\@arabic\c@paragraph}
\renewcommand\thesubparagraph {\theparagraph.\@arabic\c@subparagraph}

\renewcommand\chapter{\if@openright\cleardoublepage\else\clearpage\fi
                    \thispagestyle{plain}%
                    \global\@topnum\z@
                    \@afterindentfalse
                    \secdef\@chapter\@schapter}
\def\@chapter[#1]#2{\ifnum \c@secnumdepth >\m@ne
                         \refstepcounter{chapter}%
                         \typeout{\@chapapp\space\thechapter.}%
                         \addcontentsline{toc}{\chaptertocstyle}%
                                   {\protect\numberline{\chaptertocstr}#1}%
                    \else
                      \addcontentsline{toc}{\chaptertocstyle}{\chaptertocstr}%
                    \fi
                    \chaptermark{#1}%
                    \addtocontents{lof}{\protect\addvspace{10\p@}}%
                    \addtocontents{lot}{\protect\addvspace{10\p@}}%
                    \if@twocolumn
                     \@topnewpage[\@makechapterhead{#2}]%
                    \else
                      \@makechapterhead{#2}%
                      \@afterheading
                    \fi}
\def\@makechapterhead#1{%
  \vspace*{\chapterheadbefore}%
  {\parindent \z@ \raggedright \normalfont {\fontsize{18pt}{1em}
    \ifnum \c@secnumdepth >\m@ne
       	\bf\textsf{\tutchapter} % Chapter number
    \fi
    \hspace*{\chapterspace}
    \bf \textsf{\MakeUppercase{%
      #1
    }}}\par                         % chapter title
    \vspace{\chapterheadafter}%                % add vertical space
  }}
\def\@schapter#1{\if@twocolumn
                   \@topnewpage[\@makeschapterhead{#1}]%
                 \else
                   \@makeschapterhead{#1}%
                   \@afterheading
                 \fi}
\def\@makeschapterhead#1{%
  \vspace*{-22pt}%
  {\parindent \z@ \raggedright
    \bf\Large \textsf{\MakeUppercase{#1}}\par              % chapter title
    \vspace{12pt}%                                 % add vertical space
}}
\renewcommand\section{\@startsection {section}{1}{\z@}%
                                   {-1.8ex  \@plus -1ex \@minus -.2ex}%
                                   {2.3ex \@plus.2ex \@minus \parskip}%
                                   {\noindent \bf\large\textsf}}
\renewcommand\subsection{\@startsection{subsection}{2}{\z@}%
                                     {-1.8ex\@plus -1ex \@minus -.2ex}%
                                     {2.3ex \@plus .2ex \@minus \parskip}%
                                     {\noindent \bf\large\textsf}}
\renewcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
                                     {-3.25ex\@plus -1ex \@minus -.2ex}%
                                     {1.5ex \@plus .2ex}%
                                     {\noindent \normalfont\normalsize\bfseries}}
\renewcommand\paragraph{\@startsection{paragraph}{4}{\z@}%
                                    {3.25ex \@plus1ex \@minus.2ex}%
                                    {-1em}%
                                    {\normalfont\normalsize\bfseries}}
\renewcommand\subparagraph{\@startsection{subparagraph}{5}{\parindent}%
                                       {3.25ex \@plus1ex \@minus .2ex}%
                                       {-1em}%
                                      {\normalfont\normalsize\bfseries}}

% Määritellään puolipiste viitteiden erottimeksi [1; 2] pilkun sijaan [1, 2].

\def\@citex[#1]#2{%
  \let\@citea\@empty
  \@cite{\@for\@citeb:=#2\do
    {\@citea\def\@citea{;\penalty\@m\ }%
     \edef\@citeb{\expandafter\@firstofone\@citeb}%
     \if@filesw\immediate\write\@auxout{\string\citation{\@citeb}}\fi
     \@ifundefined{b@\@citeb}{\mbox{\reset@font\bfseries ?}%
       \G@refundefinedtrue
       \@latex@warning
         {Citation `\@citeb' on page \thepage \space undefined}}%
       {\csname b@\@citeb\endcsname}}}{#1}}

% \renewcommand\appendix{\par
%   \renewcommand\chaptertocstyle{appendix}
%   \renewcommand\chaptertocstr{\appendixname {\@arabic \c@chapter}:}
%   \renewcommand\tutchapter{\textsf{\MakeUppercase{\appendixname}}
%     {\@arabic \c@chapter}:}
%   \renewcommand\chapfigname{L{\@arabic\c@chapter}}
%   \renewcommand\chapterheadbefore{-22pt}
%   \renewcommand\chapterheadafter{10pt}
%   \setlength\chapterspace{0.0cm}
%   \setcounter{chapter}{0}%
%   \setcounter{section}{0}%
%   \gdef\@chapapp{\appendixname}%
% %  \gdef\thechapter{\textsf{\MakeUppercase{\appendixname}}
% %    {\@arabic \c@chapter}:}%
% }
% TUT specific:
\setlength\textwidth{15cm}  % tekstin leveys
\setlength\textheight{24cm} % tekstin korkeus
\setlength\headheight{15pt} % yläotsakkeen korkeus
\setlength\headsep{0.8cm}   % tila yläotsakkeen alla
\setlength\parindent{0cm}   % vaihda 0:ksi tarvittaessa
\setlength\footskip{30pt}   % tila alaviitteen yllä
\setlength\voffset{-1.3cm}  % ulommat marginaalit
\setlength\hoffset{0cm}     % ulommat marginaalit
\setlength\oddsidemargin{1.5cm} % sisemmät marginaalit parittomille sivuille
\setlength\evensidemargin{1.5cm} % sisemmät marginaalit parillisille sivuille
\setlength\topmargin{0.0cm} % sisemmät marginaalit
\setlength\brokenpenalty{1000}

\newlength\chapterspace
\setlength\chapterspace{0.4cm} % Tila otsikon numeron ja nimen välillä
\newcommand\chapterheadbefore{26pt}
\newcommand\chapterheadafter{42pt}
\newcommand\chapfigname{\thechapter}

\RequirePackage[T1]{fontenc}
\RequirePackage[utf8]{inputenc}% skandinaaviset kirjasimet
\RequirePackage{graphicx}% grafiikkapaketti
\RequirePackage{psfrag}% mahdollistaa ps-tiedostojen muokkauksen jälkikäteen
\RequirePackage{subfigure}% mahdollistaa pikkukuvat..
\RequirePackage{wrapfig}% pistaa tekstin kiertaan kuvan..
\RequirePackage{fancyhdr}% tyylikkäämmät sivutukset...
\RequirePackage{supertabular}% ylisivun mittaiset taulukot..
\RequirePackage{rotating}% taulukoiden ja kuvien kääntely
\RequirePackage{amsmath}% matematiikkakirjasto
\RequirePackage{setspace}% rivivälin vaihtoon
\RequirePackage{mdwlist} % Listojen rivinvälin määrittämiseen
\RequirePackage{parskip}



% asetetaan headerit ja footerit kuntoon
\pagestyle{fancyplain}
\rhead{\thepage}
\chead{}
\lhead{}
\lfoot{}
\cfoot{}
\rfoot{}
\renewcommand{\headrulewidth}{0pt} % Poistaa vaakaviivan

\newenvironment*{termiluettelo}
{\begin{list}{}{
\setlength{\labelwidth}{7em}
\setlength{\itemindent}{0em}
\setlength{\leftmargin}{7em}
\setlength{\labelsep}{0em}
\renewcommand*{\makelabel}[1]
{\normalfont ##1\hfil}}}
{\end{list}}

% ------------
% Caption styles
%
% Captions are in the form _*{type} {number}.*_ {caption}
% ------------

\usepackage[labelsep=period]{caption}
\captionsetup[figure]{labelfont={bf,it},textfont=it}
\renewcommand{\thetable}    {\arabic{table}}
\renewcommand{\thefigure}   {\arabic{figure}}
\renewcommand{\thesubtable} {\arabic{subtable}}
\renewcommand{\thesubfigure}{\arabic{subfigure}}


% ------------
% Images
%
% The first parameter is width of the image, and defaults to
% 70% of page width.
% Usage example: \centeredpicture[1.0]{esimKuva}{Matlabilla tehty PDF-muotoinen esimerkkikuva.}
% ------------

\newcommand{\centeredpicture}[3][0.7]{
  \begin{figure}[h]
  \begin{center}
  \includegraphics[width=#1\textwidth]{#2}
  \end{center}
  \caption{#3}
  \label{fig:#2}
  \end{figure}
}

%%
%% End of file `trtthesis.cls'.
