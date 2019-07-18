FROM iojs

COPY ./program.js ./program.js
COPY ./entry.sh ./entry.sh
RUN  chmod +x ./entry.sh

EXPOSE 3000

ENTRYPOINT ["./entry.sh"]