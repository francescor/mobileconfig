# we need node 16 due to https://itsmycode.com/error-digital-envelope-routines-unsupported/
FROM node:16-alpine
WORKDIR /app
COPY package.json ./
COPY ./ ./

RUN npm i
RUN npm install next react react-dom --save
# modify ./node_modules/mobileconfig/templates/imap.plist to skip IncomingPassword
# so to remove
#
#        <key>IncomingPassword</key>
#        <string>{{imap.password}}</string>
RUN sed -i '/<key>IncomingPassword/d' node_modules/mobileconfig/templates/imap.plist
RUN sed -i '/imap.password/d' node_modules/mobileconfig/templates/imap.plist

RUN npm run build
CMD ["npm", "run", "start"]
