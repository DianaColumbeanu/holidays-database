PGDMP                      }           HOLIDAYS    16.2    16.2 U    ^           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            _           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            `           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            a           1262    17408    HOLIDAYS    DATABASE     ~   CREATE DATABASE "HOLIDAYS" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_Europe.1252';
    DROP DATABASE "HOLIDAYS";
                postgres    false            �            1259    17473    accommodation    TABLE     �  CREATE TABLE public.accommodation (
    accommodation_id integer NOT NULL,
    name character varying(255) NOT NULL,
    address text NOT NULL,
    type character varying(100) NOT NULL,
    price_per_night numeric(10,2),
    rating numeric(3,2),
    my_notes text,
    breakfast boolean DEFAULT false,
    parking boolean DEFAULT false,
    days_of_stay integer,
    CONSTRAINT accommodation_days_of_stay_check CHECK ((days_of_stay > 0)),
    CONSTRAINT accommodation_price_per_night_check CHECK ((price_per_night >= (0)::numeric)),
    CONSTRAINT accommodation_rating_check CHECK (((rating >= (0)::numeric) AND (rating <= (5)::numeric)))
);
 !   DROP TABLE public.accommodation;
       public         heap    postgres    false            �            1259    17472 "   accommodation_accommodation_id_seq    SEQUENCE     �   CREATE SEQUENCE public.accommodation_accommodation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 9   DROP SEQUENCE public.accommodation_accommodation_id_seq;
       public          postgres    false    222            b           0    0 "   accommodation_accommodation_id_seq    SEQUENCE OWNED BY     i   ALTER SEQUENCE public.accommodation_accommodation_id_seq OWNED BY public.accommodation.accommodation_id;
          public          postgres    false    221            �            1259    17496 
   activities    TABLE     d  CREATE TABLE public.activities (
    activity_id integer NOT NULL,
    name character varying(255) NOT NULL,
    category_id integer NOT NULL,
    price numeric(10,2),
    duration integer,
    destination_id integer,
    CONSTRAINT activities_duration_check CHECK ((duration > 0)),
    CONSTRAINT activities_price_check CHECK ((price >= (0)::numeric))
);
    DROP TABLE public.activities;
       public         heap    postgres    false            �            1259    17495    activities_activity_id_seq    SEQUENCE     �   CREATE SEQUENCE public.activities_activity_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.activities_activity_id_seq;
       public          postgres    false    226            c           0    0    activities_activity_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.activities_activity_id_seq OWNED BY public.activities.activity_id;
          public          postgres    false    225            �            1259    17487    activity_categories    TABLE     �   CREATE TABLE public.activity_categories (
    category_id integer NOT NULL,
    category_name character varying(255) NOT NULL
);
 '   DROP TABLE public.activity_categories;
       public         heap    postgres    false            �            1259    17486 #   activity_categories_category_id_seq    SEQUENCE     �   CREATE SEQUENCE public.activity_categories_category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 :   DROP SEQUENCE public.activity_categories_category_id_seq;
       public          postgres    false    224            d           0    0 #   activity_categories_category_id_seq    SEQUENCE OWNED BY     k   ALTER SEQUENCE public.activity_categories_category_id_seq OWNED BY public.activity_categories.category_id;
          public          postgres    false    223            �            1259    17430    destinations    TABLE     �  CREATE TABLE public.destinations (
    destination_id integer NOT NULL,
    country character varying(255) NOT NULL,
    city character varying(255) NOT NULL,
    relief_terrain character varying(255),
    climate character varying(255),
    start_date date NOT NULL,
    end_date date NOT NULL,
    budget numeric(10,2),
    transport_id integer,
    currency character varying(10) DEFAULT 'EUR'::character varying NOT NULL,
    CONSTRAINT destinations_budget_check CHECK ((budget >= (0)::numeric))
);
     DROP TABLE public.destinations;
       public         heap    postgres    false            �            1259    17429    destinations_destination_id_seq    SEQUENCE     �   CREATE SEQUENCE public.destinations_destination_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.destinations_destination_id_seq;
       public          postgres    false    216            e           0    0    destinations_destination_id_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE public.destinations_destination_id_seq OWNED BY public.destinations.destination_id;
          public          postgres    false    215            �            1259    17547    meal_entries    TABLE     �   CREATE TABLE public.meal_entries (
    meal_entry_id integer NOT NULL,
    meal_id integer,
    restaurant_id integer,
    destination_id integer
);
     DROP TABLE public.meal_entries;
       public         heap    postgres    false            �            1259    17546    meal_entries_meal_entry_id_seq    SEQUENCE     �   CREATE SEQUENCE public.meal_entries_meal_entry_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.meal_entries_meal_entry_id_seq;
       public          postgres    false    234            f           0    0    meal_entries_meal_entry_id_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.meal_entries_meal_entry_id_seq OWNED BY public.meal_entries.meal_entry_id;
          public          postgres    false    233            �            1259    17538    meals    TABLE     �  CREATE TABLE public.meals (
    meal_id integer NOT NULL,
    date date NOT NULL,
    meal_type character varying(255),
    price numeric(10,2),
    CONSTRAINT meals_meal_type_check CHECK (((meal_type)::text = ANY ((ARRAY['Breakfast'::character varying, 'Lunch'::character varying, 'Dinner'::character varying, 'Snack'::character varying])::text[]))),
    CONSTRAINT meals_price_check CHECK ((price >= (0)::numeric))
);
    DROP TABLE public.meals;
       public         heap    postgres    false            �            1259    17537    meals_meal_id_seq    SEQUENCE     �   CREATE SEQUENCE public.meals_meal_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.meals_meal_id_seq;
       public          postgres    false    232            g           0    0    meals_meal_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.meals_meal_id_seq OWNED BY public.meals.meal_id;
          public          postgres    false    231            �            1259    17528    restaurants    TABLE       CREATE TABLE public.restaurants (
    restaurant_id integer NOT NULL,
    name character varying(255) NOT NULL,
    location text NOT NULL,
    rating numeric(3,2),
    CONSTRAINT restaurants_rating_check CHECK (((rating >= (0)::numeric) AND (rating <= (5)::numeric)))
);
    DROP TABLE public.restaurants;
       public         heap    postgres    false            �            1259    17527    restaurants_restaurant_id_seq    SEQUENCE     �   CREATE SEQUENCE public.restaurants_restaurant_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.restaurants_restaurant_id_seq;
       public          postgres    false    230            h           0    0    restaurants_restaurant_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.restaurants_restaurant_id_seq OWNED BY public.restaurants.restaurant_id;
          public          postgres    false    229            �            1259    17515 	   transport    TABLE       CREATE TABLE public.transport (
    transport_id integer NOT NULL,
    mode character varying(50) NOT NULL,
    company character varying(255),
    ticket_price numeric(10,2),
    CONSTRAINT transport_ticket_price_check CHECK ((ticket_price >= (0)::numeric))
);
    DROP TABLE public.transport;
       public         heap    postgres    false            �            1259    17514    transport_transport_id_seq    SEQUENCE     �   CREATE SEQUENCE public.transport_transport_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.transport_transport_id_seq;
       public          postgres    false    228            i           0    0    transport_transport_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.transport_transport_id_seq OWNED BY public.transport.transport_id;
          public          postgres    false    227            �            1259    17440 	   travelers    TABLE     1  CREATE TABLE public.travelers (
    traveler_id integer NOT NULL,
    first_name character varying(100) NOT NULL,
    last_name character varying(100) NOT NULL,
    gender character(1),
    age integer,
    home_address text,
    profession character varying(255),
    licence character varying(50),
    phone character varying(50),
    email character varying(100),
    destination_id integer,
    CONSTRAINT travelers_age_check CHECK ((age >= 0)),
    CONSTRAINT travelers_gender_check CHECK ((gender = ANY (ARRAY['M'::bpchar, 'F'::bpchar, 'O'::bpchar])))
);
    DROP TABLE public.travelers;
       public         heap    postgres    false            �            1259    17439    travelers_traveler_id_seq    SEQUENCE     �   CREATE SEQUENCE public.travelers_traveler_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.travelers_traveler_id_seq;
       public          postgres    false    218            j           0    0    travelers_traveler_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.travelers_traveler_id_seq OWNED BY public.travelers.traveler_id;
          public          postgres    false    217            �            1259    17460    trips    TABLE       CREATE TABLE public.trips (
    trips_id integer NOT NULL,
    trip_category character varying(255) NOT NULL,
    destination_id integer,
    start_date date NOT NULL,
    end_date date NOT NULL,
    CONSTRAINT trips_check CHECK ((end_date >= start_date))
);
    DROP TABLE public.trips;
       public         heap    postgres    false            �            1259    17459    trips_trips_id_seq    SEQUENCE     �   CREATE SEQUENCE public.trips_trips_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.trips_trips_id_seq;
       public          postgres    false    220            k           0    0    trips_trips_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.trips_trips_id_seq OWNED BY public.trips.trips_id;
          public          postgres    false    219            �           2604    17476    accommodation accommodation_id    DEFAULT     �   ALTER TABLE ONLY public.accommodation ALTER COLUMN accommodation_id SET DEFAULT nextval('public.accommodation_accommodation_id_seq'::regclass);
 M   ALTER TABLE public.accommodation ALTER COLUMN accommodation_id DROP DEFAULT;
       public          postgres    false    222    221    222            �           2604    17499    activities activity_id    DEFAULT     �   ALTER TABLE ONLY public.activities ALTER COLUMN activity_id SET DEFAULT nextval('public.activities_activity_id_seq'::regclass);
 E   ALTER TABLE public.activities ALTER COLUMN activity_id DROP DEFAULT;
       public          postgres    false    225    226    226            �           2604    17490    activity_categories category_id    DEFAULT     �   ALTER TABLE ONLY public.activity_categories ALTER COLUMN category_id SET DEFAULT nextval('public.activity_categories_category_id_seq'::regclass);
 N   ALTER TABLE public.activity_categories ALTER COLUMN category_id DROP DEFAULT;
       public          postgres    false    224    223    224            }           2604    17433    destinations destination_id    DEFAULT     �   ALTER TABLE ONLY public.destinations ALTER COLUMN destination_id SET DEFAULT nextval('public.destinations_destination_id_seq'::regclass);
 J   ALTER TABLE public.destinations ALTER COLUMN destination_id DROP DEFAULT;
       public          postgres    false    215    216    216            �           2604    17550    meal_entries meal_entry_id    DEFAULT     �   ALTER TABLE ONLY public.meal_entries ALTER COLUMN meal_entry_id SET DEFAULT nextval('public.meal_entries_meal_entry_id_seq'::regclass);
 I   ALTER TABLE public.meal_entries ALTER COLUMN meal_entry_id DROP DEFAULT;
       public          postgres    false    234    233    234            �           2604    17541    meals meal_id    DEFAULT     n   ALTER TABLE ONLY public.meals ALTER COLUMN meal_id SET DEFAULT nextval('public.meals_meal_id_seq'::regclass);
 <   ALTER TABLE public.meals ALTER COLUMN meal_id DROP DEFAULT;
       public          postgres    false    232    231    232            �           2604    17531    restaurants restaurant_id    DEFAULT     �   ALTER TABLE ONLY public.restaurants ALTER COLUMN restaurant_id SET DEFAULT nextval('public.restaurants_restaurant_id_seq'::regclass);
 H   ALTER TABLE public.restaurants ALTER COLUMN restaurant_id DROP DEFAULT;
       public          postgres    false    229    230    230            �           2604    17518    transport transport_id    DEFAULT     �   ALTER TABLE ONLY public.transport ALTER COLUMN transport_id SET DEFAULT nextval('public.transport_transport_id_seq'::regclass);
 E   ALTER TABLE public.transport ALTER COLUMN transport_id DROP DEFAULT;
       public          postgres    false    228    227    228                       2604    17443    travelers traveler_id    DEFAULT     ~   ALTER TABLE ONLY public.travelers ALTER COLUMN traveler_id SET DEFAULT nextval('public.travelers_traveler_id_seq'::regclass);
 D   ALTER TABLE public.travelers ALTER COLUMN traveler_id DROP DEFAULT;
       public          postgres    false    218    217    218            �           2604    17463    trips trips_id    DEFAULT     p   ALTER TABLE ONLY public.trips ALTER COLUMN trips_id SET DEFAULT nextval('public.trips_trips_id_seq'::regclass);
 =   ALTER TABLE public.trips ALTER COLUMN trips_id DROP DEFAULT;
       public          postgres    false    219    220    220            O          0    17473    accommodation 
   TABLE DATA           �   COPY public.accommodation (accommodation_id, name, address, type, price_per_night, rating, my_notes, breakfast, parking, days_of_stay) FROM stdin;
    public          postgres    false    222   Co       S          0    17496 
   activities 
   TABLE DATA           e   COPY public.activities (activity_id, name, category_id, price, duration, destination_id) FROM stdin;
    public          postgres    false    226   @p       Q          0    17487    activity_categories 
   TABLE DATA           I   COPY public.activity_categories (category_id, category_name) FROM stdin;
    public          postgres    false    224   �p       I          0    17430    destinations 
   TABLE DATA           �   COPY public.destinations (destination_id, country, city, relief_terrain, climate, start_date, end_date, budget, transport_id, currency) FROM stdin;
    public          postgres    false    216   
q       [          0    17547    meal_entries 
   TABLE DATA           ]   COPY public.meal_entries (meal_entry_id, meal_id, restaurant_id, destination_id) FROM stdin;
    public          postgres    false    234   �q       Y          0    17538    meals 
   TABLE DATA           @   COPY public.meals (meal_id, date, meal_type, price) FROM stdin;
    public          postgres    false    232   r       W          0    17528    restaurants 
   TABLE DATA           L   COPY public.restaurants (restaurant_id, name, location, rating) FROM stdin;
    public          postgres    false    230   �r       U          0    17515 	   transport 
   TABLE DATA           N   COPY public.transport (transport_id, mode, company, ticket_price) FROM stdin;
    public          postgres    false    228   s       K          0    17440 	   travelers 
   TABLE DATA           �   COPY public.travelers (traveler_id, first_name, last_name, gender, age, home_address, profession, licence, phone, email, destination_id) FROM stdin;
    public          postgres    false    218   ms       M          0    17460    trips 
   TABLE DATA           ^   COPY public.trips (trips_id, trip_category, destination_id, start_date, end_date) FROM stdin;
    public          postgres    false    220   =u       l           0    0 "   accommodation_accommodation_id_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.accommodation_accommodation_id_seq', 3, true);
          public          postgres    false    221            m           0    0    activities_activity_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.activities_activity_id_seq', 4, true);
          public          postgres    false    225            n           0    0 #   activity_categories_category_id_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public.activity_categories_category_id_seq', 5, true);
          public          postgres    false    223            o           0    0    destinations_destination_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.destinations_destination_id_seq', 6, true);
          public          postgres    false    215            p           0    0    meal_entries_meal_entry_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.meal_entries_meal_entry_id_seq', 6, true);
          public          postgres    false    233            q           0    0    meals_meal_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.meals_meal_id_seq', 6, true);
          public          postgres    false    231            r           0    0    restaurants_restaurant_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.restaurants_restaurant_id_seq', 4, true);
          public          postgres    false    229            s           0    0    transport_transport_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.transport_transport_id_seq', 3, true);
          public          postgres    false    227            t           0    0    travelers_traveler_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.travelers_traveler_id_seq', 37, true);
          public          postgres    false    217            u           0    0    trips_trips_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.trips_trips_id_seq', 1, false);
          public          postgres    false    219            �           2606    17485     accommodation accommodation_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.accommodation
    ADD CONSTRAINT accommodation_pkey PRIMARY KEY (accommodation_id);
 J   ALTER TABLE ONLY public.accommodation DROP CONSTRAINT accommodation_pkey;
       public            postgres    false    222            �           2606    17503    activities activities_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY public.activities
    ADD CONSTRAINT activities_pkey PRIMARY KEY (activity_id);
 D   ALTER TABLE ONLY public.activities DROP CONSTRAINT activities_pkey;
       public            postgres    false    226            �           2606    17494 9   activity_categories activity_categories_category_name_key 
   CONSTRAINT     }   ALTER TABLE ONLY public.activity_categories
    ADD CONSTRAINT activity_categories_category_name_key UNIQUE (category_name);
 c   ALTER TABLE ONLY public.activity_categories DROP CONSTRAINT activity_categories_category_name_key;
       public            postgres    false    224            �           2606    17492 ,   activity_categories activity_categories_pkey 
   CONSTRAINT     s   ALTER TABLE ONLY public.activity_categories
    ADD CONSTRAINT activity_categories_pkey PRIMARY KEY (category_id);
 V   ALTER TABLE ONLY public.activity_categories DROP CONSTRAINT activity_categories_pkey;
       public            postgres    false    224            �           2606    17438    destinations destinations_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.destinations
    ADD CONSTRAINT destinations_pkey PRIMARY KEY (destination_id);
 H   ALTER TABLE ONLY public.destinations DROP CONSTRAINT destinations_pkey;
       public            postgres    false    216            �           2606    17552    meal_entries meal_entries_pkey 
   CONSTRAINT     g   ALTER TABLE ONLY public.meal_entries
    ADD CONSTRAINT meal_entries_pkey PRIMARY KEY (meal_entry_id);
 H   ALTER TABLE ONLY public.meal_entries DROP CONSTRAINT meal_entries_pkey;
       public            postgres    false    234            �           2606    17545    meals meals_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.meals
    ADD CONSTRAINT meals_pkey PRIMARY KEY (meal_id);
 :   ALTER TABLE ONLY public.meals DROP CONSTRAINT meals_pkey;
       public            postgres    false    232            �           2606    17536    restaurants restaurants_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY public.restaurants
    ADD CONSTRAINT restaurants_pkey PRIMARY KEY (restaurant_id);
 F   ALTER TABLE ONLY public.restaurants DROP CONSTRAINT restaurants_pkey;
       public            postgres    false    230            �           2606    17521    transport transport_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.transport
    ADD CONSTRAINT transport_pkey PRIMARY KEY (transport_id);
 B   ALTER TABLE ONLY public.transport DROP CONSTRAINT transport_pkey;
       public            postgres    false    228            �           2606    17453    travelers travelers_email_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public.travelers
    ADD CONSTRAINT travelers_email_key UNIQUE (email);
 G   ALTER TABLE ONLY public.travelers DROP CONSTRAINT travelers_email_key;
       public            postgres    false    218            �           2606    17451    travelers travelers_phone_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public.travelers
    ADD CONSTRAINT travelers_phone_key UNIQUE (phone);
 G   ALTER TABLE ONLY public.travelers DROP CONSTRAINT travelers_phone_key;
       public            postgres    false    218            �           2606    17449    travelers travelers_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.travelers
    ADD CONSTRAINT travelers_pkey PRIMARY KEY (traveler_id);
 B   ALTER TABLE ONLY public.travelers DROP CONSTRAINT travelers_pkey;
       public            postgres    false    218            �           2606    17466    trips trips_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.trips
    ADD CONSTRAINT trips_pkey PRIMARY KEY (trips_id);
 :   ALTER TABLE ONLY public.trips DROP CONSTRAINT trips_pkey;
       public            postgres    false    220            �           2606    17504 )   activities activities_destination_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.activities
    ADD CONSTRAINT activities_destination_id_fkey FOREIGN KEY (destination_id) REFERENCES public.destinations(destination_id) ON DELETE CASCADE;
 S   ALTER TABLE ONLY public.activities DROP CONSTRAINT activities_destination_id_fkey;
       public          postgres    false    4760    216    226            �           2606    17509    activities fk_category    FK CONSTRAINT     �   ALTER TABLE ONLY public.activities
    ADD CONSTRAINT fk_category FOREIGN KEY (category_id) REFERENCES public.activity_categories(category_id);
 @   ALTER TABLE ONLY public.activities DROP CONSTRAINT fk_category;
       public          postgres    false    224    4774    226            �           2606    17522    destinations fk_transport    FK CONSTRAINT     �   ALTER TABLE ONLY public.destinations
    ADD CONSTRAINT fk_transport FOREIGN KEY (transport_id) REFERENCES public.transport(transport_id) ON DELETE SET NULL;
 C   ALTER TABLE ONLY public.destinations DROP CONSTRAINT fk_transport;
       public          postgres    false    228    216    4778            �           2606    17563 -   meal_entries meal_entries_destination_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.meal_entries
    ADD CONSTRAINT meal_entries_destination_id_fkey FOREIGN KEY (destination_id) REFERENCES public.destinations(destination_id) ON DELETE CASCADE;
 W   ALTER TABLE ONLY public.meal_entries DROP CONSTRAINT meal_entries_destination_id_fkey;
       public          postgres    false    216    234    4760            �           2606    17553 &   meal_entries meal_entries_meal_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.meal_entries
    ADD CONSTRAINT meal_entries_meal_id_fkey FOREIGN KEY (meal_id) REFERENCES public.meals(meal_id) ON DELETE CASCADE;
 P   ALTER TABLE ONLY public.meal_entries DROP CONSTRAINT meal_entries_meal_id_fkey;
       public          postgres    false    234    4782    232            �           2606    17558 ,   meal_entries meal_entries_restaurant_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.meal_entries
    ADD CONSTRAINT meal_entries_restaurant_id_fkey FOREIGN KEY (restaurant_id) REFERENCES public.restaurants(restaurant_id) ON DELETE CASCADE;
 V   ALTER TABLE ONLY public.meal_entries DROP CONSTRAINT meal_entries_restaurant_id_fkey;
       public          postgres    false    234    4780    230            �           2606    17454 '   travelers travelers_destination_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.travelers
    ADD CONSTRAINT travelers_destination_id_fkey FOREIGN KEY (destination_id) REFERENCES public.destinations(destination_id) ON DELETE CASCADE;
 Q   ALTER TABLE ONLY public.travelers DROP CONSTRAINT travelers_destination_id_fkey;
       public          postgres    false    218    216    4760            �           2606    17467    trips trips_destination_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.trips
    ADD CONSTRAINT trips_destination_id_fkey FOREIGN KEY (destination_id) REFERENCES public.destinations(destination_id) ON DELETE CASCADE;
 I   ALTER TABLE ONLY public.trips DROP CONSTRAINT trips_destination_id_fkey;
       public          postgres    false    4760    216    220            O   �   x�MO�j�@<�~�>���m��RJs�E]k�%�*�
)���C�@��h4S��(1�c:�W�D4�������M���0M^�	c��^��AZ� 	�����"�vfq+�0�#�����%"L���|Ҁ��� U��[�=����T������#sn%�5�#[1�w^?�W�y�`2XC���$�Miks�z�O4A�0�l��4�M]VO��*}cL��di�rk��.t�      S   p   x�E�1�0�W��1�R�N��t���哌)�{,���-f4#�V�~&e�����Ä�<V���5�Fx������X��b���ڷn���|�?�f�{�b��{ �%9!�      Q   :   x�3��--N-��2�tJML��2��M���2�t.�))-J�2���/(��K����� m{      I   �   x���M�0�s�_6�u���p�a"~ܼ��е��⿷~L��A /�y��(����5�ūG-��'���Y^�l���� YI�1��]��:��֑�+������{���p�X&��S�R���ݦL9��	˼�bd��y{Qf��q��$��2����qC3h��p���h�q�e윲$I���u$      [   0   x�3�4A.#N#0m�i�M8M�"F\���@c.3N3��W� �/K      Y   Z   x�M�1� �z���
��G�3&�P�x���e�I �"ZfZ�R��p��NB�S�����T!�M�����HD)�
u�Y%�Ң��9c�)�"i      W   �   x�E��
AD��+�Ǳꪵ
�'Zڄ5``ٕ�6���F�70of'�igRw�=[�\�/uty���&��ƭUS��M+����vl�_�m�`�1}�0j�R��:`��C�4��	�5IG�qI�}x����/�      U   B   x�3�t,����q���4420�30�2��M<133�H3g��D��4�21/1���"���� ��s      K   �  x����n�@���)� P�v'7ܔ$\ �8�2���H�]��#țp�U��X�7���D>$��2_�S�!T�O�	�/�+;#~�h�U������r��{��5̲4�f?P���F��k$yU�������`��P{���2��!|����0��ǎ��|c�c:�Vܭ��n�ًf@��E�<áRp��A��+��� ��|�ۄ��wd6�%����\�i8V��|��z���mF���'�L�<���}���x�ۿlN��Z���j8<Q�^�g���W���:˜�ش�6�[��;����ұO6��M`�Y(�1f�3f���5/�Z��Y��L�9�v�_�l�A:�h�0/��H-��Nv��w��C��	wR�n�R���R���M�>Ё:����VH�ݯY��	��6ᾫ�g%�~>~��V"|�8��������U �<kV      M      x������ � �     