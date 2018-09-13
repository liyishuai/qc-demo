QC=quickChick -color -ocamlbuild '-lib unix' -N 100 -exclude ".git"
TMP_DIR=../_qc_qc-demo.tmp

all: Makefile.coq add.cmxs Add
	$(MAKE) -f $<

test: qc
	time ./$<
	time $(QC)

Makefile.coq: _CoqProject
	coq_makefile -f $< -o $@

qc: qc.hs
	ghc $@

clean:
	if [ -e Makefile.coq ]; then $(MAKE) -f Makefile.coq clean; fi
	$(RM) -r $(TMP_DIR) *~ .*.aux *.cmxs Makefile.coq* Add qc *.hi *.o

%.cmxs: %.ml
	ocamlopt -shared -o $@
