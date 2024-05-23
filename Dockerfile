FROM node:20

RUN corepack enable
ENV PNPM_HOME="/pnpm"
ENV PATH="$PNPM_HOME:$PATH"

USER node
## END IMAGE HERE

## START NEW IMAGE
COPY --chown=node:node . ./home/node/code
WORKDIR /home/node/code
RUN corepack use pnpm@8

RUN pnpm install --frozen-lockfile
RUN pnpm nx run docker2:build
RUN pnpm nx run docker2:preview

