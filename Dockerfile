FROM perl

WORKDIR /usr/src/
ADD . /usr/src/
RUN \
  cpanm \
    Config::General \
    DBD::mysql \
    DBI \
    File::Spec \
    Net::Statsd \
    Text::CSV_XS \
  && \
  rm -rf ~/.cpanm/ \
  && \
  unlink conf/enabled/example.conf

ENTRYPOINT [ "perl", "bin/sql_query_output_to_statsd" ]
