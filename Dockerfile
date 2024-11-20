FROM elixir:latest

RUN wget https://github.com/exercism/cli/releases/download/v3.5.4/exercism-3.5.4-linux-arm64.tar.gz
RUN tar -xzf exercism-3.5.4-linux-arm64.tar.gz
RUN mkdir -p ~/bin
RUN mv exercism ~/bin/
RUN rm exercism-3.5.4-linux-arm64.tar.gz
ENV PATH=~/bin:$PATH
