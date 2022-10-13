@default_files=('main');

$pdf_mode = 5;
$xelatex = "xelatex --shell-escape %O %S";
$pdflatex = "xelatex --shell-escape %O %S";
$bibtex_use = 1.5;
$preview_mode = 1;
$out_dir="./out";
$makeindex="makeindex -s gind.ist %O -o %D %S";
add_cus_dep('glo', 'gls', 0, 'run_makeglossaries');
add_cus_dep('acn', 'acr', 0, 'run_makeglossaries');
add_cus_dep('glo', 'gls', 0, 'makeglo2gls');

sub run_makeglossaries {
  if ( $silent ) {
    system "makeglossaries -q $_[0]";
  }
  else {
    system "makeglossaries $_[0]";
  };
}
sub makeglo2gls {
    system("makeindex -s gglo.ist -o \"$_[0].gls\" \"$_[0].glo\"");
}
push @generated_exts, 'glo', 'gls', 'glg';
push @generated_exts, 'acn', 'acr', 'alg';
push @generated_exts, 'synctex.gz';
$clean_ext .= ' %R.ist %R.xdv thm bbl hd synctex.gz xdv';