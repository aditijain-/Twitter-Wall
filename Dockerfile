FROM rails:onbuild

RUN rake db:migrate
RUN rake db:seed