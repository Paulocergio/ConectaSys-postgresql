PGDMP  0        	             }         
   ConectaSys    17.2    17.2 &    X           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false            Y           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false            Z           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false            [           1262    16389 
   ConectaSys    DATABASE     �   CREATE DATABASE "ConectaSys" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Portuguese_Brazil.1252';
    DROP DATABASE "ConectaSys";
                     postgres    false                        3079    16390 	   uuid-ossp 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;
    DROP EXTENSION "uuid-ossp";
                        false            \           0    0    EXTENSION "uuid-ossp"    COMMENT     W   COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';
                             false    2            �            1259    32774    logs    TABLE       CREATE TABLE public.logs (
    id integer NOT NULL,
    "timestamp" timestamp without time zone DEFAULT now(),
    loglevel character varying(50),
    message text,
    eventid integer,
    exception text,
    additionaldata jsonb,
    "AdditionalData" jsonb,
    "EventId" integer
);
    DROP TABLE public.logs;
       public         heap r       postgres    false            �            1259    32773    logs_id_seq    SEQUENCE     �   CREATE SEQUENCE public.logs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.logs_id_seq;
       public               postgres    false    220            ]           0    0    logs_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE public.logs_id_seq OWNED BY public.logs.id;
          public               postgres    false    219            �            1259    49186    product    TABLE     �  CREATE TABLE public.product (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    description text,
    price numeric(10,2) NOT NULL,
    stock_quantity integer NOT NULL,
    product_code character varying(50),
    category character varying(100),
    brand character varying(100),
    weight numeric(10,2),
    dimensions character varying(100),
    image_url text,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    status character varying(50) DEFAULT 'active'::character varying,
    supplier_id integer,
    cost numeric(10,2),
    profit_margin numeric(5,2),
    discount numeric(5,2),
    unit_of_measure character varying(50),
    tags text[]
);
    DROP TABLE public.product;
       public         heap r       postgres    false            �            1259    49185    product_id_seq    SEQUENCE     �   CREATE SEQUENCE public.product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.product_id_seq;
       public               postgres    false    224            ^           0    0    product_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.product_id_seq OWNED BY public.product.id;
          public               postgres    false    223            �            1259    49173    supplier    TABLE     �  CREATE TABLE public.supplier (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    contact_name character varying(255),
    phone character varying(20),
    email character varying(255),
    address text,
    city character varying(100),
    state character varying(100),
    country character varying(100),
    zip_code character varying(20),
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.supplier;
       public         heap r       postgres    false            �            1259    49172    supplier_id_seq    SEQUENCE     �   CREATE SEQUENCE public.supplier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.supplier_id_seq;
       public               postgres    false    222            _           0    0    supplier_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.supplier_id_seq OWNED BY public.supplier.id;
          public               postgres    false    221            �            1259    16447    users    TABLE     �  CREATE TABLE public.users (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    createdat timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updatedat timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    role character varying(50),
    phone character varying(20),
    is_active boolean DEFAULT true,
    password_hash character varying(255)
);
    DROP TABLE public.users;
       public         heap r       postgres    false    2            �           2604    32777    logs id    DEFAULT     b   ALTER TABLE ONLY public.logs ALTER COLUMN id SET DEFAULT nextval('public.logs_id_seq'::regclass);
 6   ALTER TABLE public.logs ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    220    219    220            �           2604    49189 
   product id    DEFAULT     h   ALTER TABLE ONLY public.product ALTER COLUMN id SET DEFAULT nextval('public.product_id_seq'::regclass);
 9   ALTER TABLE public.product ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    224    223    224            �           2604    49176    supplier id    DEFAULT     j   ALTER TABLE ONLY public.supplier ALTER COLUMN id SET DEFAULT nextval('public.supplier_id_seq'::regclass);
 :   ALTER TABLE public.supplier ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    222    221    222            Q          0    32774    logs 
   TABLE DATA           �   COPY public.logs (id, "timestamp", loglevel, message, eventid, exception, additionaldata, "AdditionalData", "EventId") FROM stdin;
    public               postgres    false    220   a.       U          0    49186    product 
   TABLE DATA           �   COPY public.product (id, name, description, price, stock_quantity, product_code, category, brand, weight, dimensions, image_url, created_at, updated_at, status, supplier_id, cost, profit_margin, discount, unit_of_measure, tags) FROM stdin;
    public               postgres    false    224   F2       S          0    49173    supplier 
   TABLE DATA           �   COPY public.supplier (id, name, contact_name, phone, email, address, city, state, country, zip_code, created_at, updated_at) FROM stdin;
    public               postgres    false    222   c2       O          0    16447    users 
   TABLE DATA           m   COPY public.users (id, name, email, createdat, updatedat, role, phone, is_active, password_hash) FROM stdin;
    public               postgres    false    218   �2       `           0    0    logs_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.logs_id_seq', 322, true);
          public               postgres    false    219            a           0    0    product_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.product_id_seq', 1, true);
          public               postgres    false    223            b           0    0    supplier_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.supplier_id_seq', 1, false);
          public               postgres    false    221            �           2606    16458    users Users_Email_key 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT "Users_Email_key" UNIQUE (email);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT "Users_Email_key";
       public                 postgres    false    218            �           2606    16456    users Users_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.users
    ADD CONSTRAINT "Users_pkey" PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.users DROP CONSTRAINT "Users_pkey";
       public                 postgres    false    218            �           2606    32782    logs logs_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.logs
    ADD CONSTRAINT logs_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.logs DROP CONSTRAINT logs_pkey;
       public                 postgres    false    220            �           2606    49196    product product_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.product DROP CONSTRAINT product_pkey;
       public                 postgres    false    224            �           2606    49198     product product_product_code_key 
   CONSTRAINT     c   ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_product_code_key UNIQUE (product_code);
 J   ALTER TABLE ONLY public.product DROP CONSTRAINT product_product_code_key;
       public                 postgres    false    224            �           2606    49182    supplier supplier_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.supplier
    ADD CONSTRAINT supplier_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.supplier DROP CONSTRAINT supplier_pkey;
       public                 postgres    false    222            �           1259    49205    idx_product_category    INDEX     L   CREATE INDEX idx_product_category ON public.product USING btree (category);
 (   DROP INDEX public.idx_product_category;
       public                 postgres    false    224            �           1259    49204    idx_product_name    INDEX     D   CREATE INDEX idx_product_name ON public.product USING btree (name);
 $   DROP INDEX public.idx_product_name;
       public                 postgres    false    224            �           1259    49206    idx_product_status    INDEX     H   CREATE INDEX idx_product_status ON public.product USING btree (status);
 &   DROP INDEX public.idx_product_status;
       public                 postgres    false    224            �           1259    49184    idx_supplier_city    INDEX     F   CREATE INDEX idx_supplier_city ON public.supplier USING btree (city);
 %   DROP INDEX public.idx_supplier_city;
       public                 postgres    false    222            �           1259    49183    idx_supplier_name    INDEX     F   CREATE INDEX idx_supplier_name ON public.supplier USING btree (name);
 %   DROP INDEX public.idx_supplier_name;
       public                 postgres    false    222            �           2606    49199    product fk_supplier    FK CONSTRAINT     y   ALTER TABLE ONLY public.product
    ADD CONSTRAINT fk_supplier FOREIGN KEY (supplier_id) REFERENCES public.supplier(id);
 =   ALTER TABLE ONLY public.product DROP CONSTRAINT fk_supplier;
       public               postgres    false    224    4789    222            Q   �  x��W�n�6����wN�D�D�0��qWnZ��vQ#q�0I$*i�6}���(�^lIA�:E�b�aQ$q>��|<�� C�N :� �Cχ����?u�H��`�Q�Q!8��$�iIR��oe.eT^�8��٧L�3�����D����?��y:MF�(�(<��A�����zQ���j��FU/�����,�[����,���R��J���Yf��X����kP���l
ʃ���CQ�I��˽*&Qa�J@������<���*
Jg�8��Ŷa}�|,<B����ָJ����Kc���,ց���0��1�A@�G �@�g1�����F@�s��6�Y��QP���)�1p��ܒ�&��A�,�m�d�X�u1*v���rB�7Q��D����F�:�^Z��=�].Ў�N-A�Z�I���П���
��~*��'/d��(����涏F�k�X�ݙ�����k�_��ħK�-a��Դ�EwX��2F)"��^!W0��D��w 0�nm\�=U��=8���D�a�a����"���;�����b@ ��
�x��Q;�D8�[���$�ɧ�EM�����#�WS�]�68` ��V'���@]���M!��Y��^Ή��R`����e�A�P�u��7*�6]nB�ۉ2֧�ʯ���\��5EA-�)�1��1��w@p3撧��fd �˞���VK�r	{�P�jE֖=�~p
E���;
Bq��ϔBQ�ݪ��K@�>)��5��=��7|��fu���W�6�VF��18�Pc��2P�^/�j��Ʈ�R&�z�lb���x���+�?���.g`|1{���a��-�5���U��_�~�M܏*���&�FSphI�	���I���=���=��;z�)�V�]E������4�A5��o3SnsG듋5��H��"J��=(���i��A�2
�g��;�^�� �      U      x������ � �      S      x������ � �      O     x���OO�0��ݧ����mߖ�;�$��H��K�7�c�7$������$O.�J�PPk��BIM�)���ny�����{ׄCb�]Ǯ&���(�f�d1�9R��XW��h�h8#�q�c���=�tY�3�]���02u�J�O��_-ڏT���|�u�n~����c�)��TxYPǅ�ƂE�V�9�CSW��߻�	���X��:�/gzm���i���'��}%��Y>��V�Yy|��Nmt|��K2=�@�.�f��^�(�~ |�h�     