QC=quickChick -color -ocamlbuild '-lib unix' -N 100 -exclude ".git"
TMP_DIR=../_qc_qc-demo.tmp

all: Makefile.coq add.cmxs Add
	$(MAKE) -f $<

test:
	time $(QC)

Makefile.coq: _CoqProject
	coq_makefile -f $< -o $@

%.cmxs: %.ml
	$Vocamlopt -shared -o $@

clean:
	if [ -e Makefile.coq ]; then $(MAKE) -f Makefile.coq clean; fi
	$(RM) -r $(TMP_DIR) *~ .*.aux *.cmxs Makefile.coq* Add

%.cmxs: %.ml
	ocamlopt -shared -o $@
