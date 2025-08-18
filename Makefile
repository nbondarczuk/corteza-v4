up ps down:
	pushd corteza; make $@; popd
	pushd only-office-document-server; make $@; popd
	pushd only-office-service-api; make $@; popd

clean:
	pushd only-office-service-api; make $@; popd
