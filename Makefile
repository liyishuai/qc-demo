all: Makefile.coq
	$(MAKE) -f $<

Makefile.coq: _CoqProject
	coq_makefile -f $< -o $@

clean:
	if [ -e Makefile.coq ]; then $(MAKE) -f Makefile.coq clean; fi
	$(RM) -r $(TMP_DIR) *~ .*.aux *.cmxs Makefile.coq* Add qc *.hi *.o
