-- Table: public.botscore

-- DROP TABLE public.botscore;
CREATE TABLE public.botscore
(
  id SERIAL PRIMARY KEY NOT NULL,
  user_id bigint NOT NULL,
  screen_name character varying(15),
  time_stamp timestamp with time zone DEFAULT now(),
  all_bot_scores jsonb,
  bot_score_english real,
  bot_score_universal real,
  requester_ip text,
  tweets_per_day real,
  num_submitted_timeline_tweets integer,
  num_submitted_mention_tweets integer,
  num_requests integer
)
WITH (
  OIDS=FALSE
);

ALTER TABLE public.botscore
  OWNER TO botometer;

-- Constraint: botscore_user_id_time_stamp_requester_ip_key

-- DROP CONSTRAINT botscore_user_id_time_stamp_requester_ip_key

ALTER TABLE public.botscore
  ADD CONSTRAINT botscore_user_id_time_stamp_requester_ip_key
  UNIQUE (user_id, time_stamp, requester_ip);

-- Index: public.botscore_ix_botscoreenglish

-- DROP INDEX public.botscore_ix_botscoreenglish;

CREATE INDEX botscore_ix_botscoreenglish
  ON public.botscore
  USING btree
  (bot_score_english);

-- Index: public.botscore_ix_botscoreuniversal

-- DROP INDEX public.botscore_ix_botscoreuniversal;

CREATE INDEX botscore_ix_botscoreuniversal
  ON public.botscore
  USING btree
  (bot_score_universal);

-- Index: public.botscore_ix_screenname

-- DROP INDEX public.botscore_ix_screenname;

CREATE INDEX botscore_ix_screenname
  ON public.botscore
  USING btree
  (screen_name);
  
-- Index: public.botscore_ix_timestamp

-- DROP INDEX public.botscore_ix_timestamp;

CREATE INDEX botscore_ix_timestamp
  ON public.botscore
  USING brin
  (time_stamp);

-- Index: public.botscore_ix_requesterip

-- DROP INDEX public.botscore_ix_requesterip;

CREATE INDEX botscore_ix_requesterip
  ON public.botscore
  USING btree
  (requester_ip COLLATE pg_catalog."default");

-- Index: public.botscore_ix_userid_timestamp

-- DROP INDEX public.botscore_ix_userid_timestamp;

CREATE INDEX botscore_ix_userid_timestamp
  ON public.botscore
  USING btree
  (user_id, time_stamp);

