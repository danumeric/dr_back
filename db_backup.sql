PGDMP     ,                    {            postgres    15.2 (Debian 15.2-1.pgdg110+1)    15.2 (    &           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            '           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            (           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            )           1262    5    postgres    DATABASE     s   CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';
    DROP DATABASE postgres;
                dan    false            *           0    0    DATABASE postgres    COMMENT     N   COMMENT ON DATABASE postgres IS 'default administrative connection database';
                   dan    false    3369                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
                pg_database_owner    false            +           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                   pg_database_owner    false    4            �            1259    16408    Category    TABLE     U   CREATE TABLE public."Category" (
    id integer NOT NULL,
    title text NOT NULL
);
    DROP TABLE public."Category";
       public         heap    dan    false    4            �            1259    16407    Category_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Category_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public."Category_id_seq";
       public          dan    false    4    218            ,           0    0    Category_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public."Category_id_seq" OWNED BY public."Category".id;
          public          dan    false    217            �            1259    16399    Dish    TABLE     �   CREATE TABLE public."Dish" (
    id integer NOT NULL,
    title text NOT NULL,
    weight_gramm integer NOT NULL,
    price_rub integer NOT NULL,
    description text,
    "imageSrc" text
);
    DROP TABLE public."Dish";
       public         heap    dan    false    4            �            1259    16398    Dish_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Dish_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public."Dish_id_seq";
       public          dan    false    4    216            -           0    0    Dish_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public."Dish_id_seq" OWNED BY public."Dish".id;
          public          dan    false    215            �            1259    16417    User    TABLE     m   CREATE TABLE public."User" (
    id integer NOT NULL,
    login text NOT NULL,
    password text NOT NULL
);
    DROP TABLE public."User";
       public         heap    dan    false    4            �            1259    16416    User_id_seq    SEQUENCE     �   CREATE SEQUENCE public."User_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public."User_id_seq";
       public          dan    false    220    4            .           0    0    User_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public."User_id_seq" OWNED BY public."User".id;
          public          dan    false    219            �            1259    16425    _CategoryToDish    TABLE     ^   CREATE TABLE public."_CategoryToDish" (
    "A" integer NOT NULL,
    "B" integer NOT NULL
);
 %   DROP TABLE public."_CategoryToDish";
       public         heap    dan    false    4            �            1259    16387    _prisma_migrations    TABLE     �  CREATE TABLE public._prisma_migrations (
    id character varying(36) NOT NULL,
    checksum character varying(64) NOT NULL,
    finished_at timestamp with time zone,
    migration_name character varying(255) NOT NULL,
    logs text,
    rolled_back_at timestamp with time zone,
    started_at timestamp with time zone DEFAULT now() NOT NULL,
    applied_steps_count integer DEFAULT 0 NOT NULL
);
 &   DROP TABLE public._prisma_migrations;
       public         heap    dan    false    4            }           2604    16411    Category id    DEFAULT     n   ALTER TABLE ONLY public."Category" ALTER COLUMN id SET DEFAULT nextval('public."Category_id_seq"'::regclass);
 <   ALTER TABLE public."Category" ALTER COLUMN id DROP DEFAULT;
       public          dan    false    217    218    218            |           2604    16402    Dish id    DEFAULT     f   ALTER TABLE ONLY public."Dish" ALTER COLUMN id SET DEFAULT nextval('public."Dish_id_seq"'::regclass);
 8   ALTER TABLE public."Dish" ALTER COLUMN id DROP DEFAULT;
       public          dan    false    216    215    216            ~           2604    16420    User id    DEFAULT     f   ALTER TABLE ONLY public."User" ALTER COLUMN id SET DEFAULT nextval('public."User_id_seq"'::regclass);
 8   ALTER TABLE public."User" ALTER COLUMN id DROP DEFAULT;
       public          dan    false    220    219    220                       0    16408    Category 
   TABLE DATA           /   COPY public."Category" (id, title) FROM stdin;
    public          dan    false    218   '*                 0    16399    Dish 
   TABLE DATA           ]   COPY public."Dish" (id, title, weight_gramm, price_rub, description, "imageSrc") FROM stdin;
    public          dan    false    216   �*       "          0    16417    User 
   TABLE DATA           5   COPY public."User" (id, login, password) FROM stdin;
    public          dan    false    220   �+       #          0    16425    _CategoryToDish 
   TABLE DATA           5   COPY public."_CategoryToDish" ("A", "B") FROM stdin;
    public          dan    false    221   ,                 0    16387    _prisma_migrations 
   TABLE DATA           �   COPY public._prisma_migrations (id, checksum, finished_at, migration_name, logs, rolled_back_at, started_at, applied_steps_count) FROM stdin;
    public          dan    false    214   Y,       /           0    0    Category_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public."Category_id_seq"', 5, true);
          public          dan    false    217            0           0    0    Dish_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public."Dish_id_seq"', 13, true);
          public          dan    false    215            1           0    0    User_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public."User_id_seq"', 1, true);
          public          dan    false    219            �           2606    16415    Category Category_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public."Category"
    ADD CONSTRAINT "Category_pkey" PRIMARY KEY (id);
 D   ALTER TABLE ONLY public."Category" DROP CONSTRAINT "Category_pkey";
       public            dan    false    218            �           2606    16406    Dish Dish_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public."Dish"
    ADD CONSTRAINT "Dish_pkey" PRIMARY KEY (id);
 <   ALTER TABLE ONLY public."Dish" DROP CONSTRAINT "Dish_pkey";
       public            dan    false    216            �           2606    16424    User User_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public."User"
    ADD CONSTRAINT "User_pkey" PRIMARY KEY (id);
 <   ALTER TABLE ONLY public."User" DROP CONSTRAINT "User_pkey";
       public            dan    false    220            �           2606    16395 *   _prisma_migrations _prisma_migrations_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public._prisma_migrations
    ADD CONSTRAINT _prisma_migrations_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public._prisma_migrations DROP CONSTRAINT _prisma_migrations_pkey;
       public            dan    false    214            �           1259    16429    Category_title_key    INDEX     S   CREATE UNIQUE INDEX "Category_title_key" ON public."Category" USING btree (title);
 (   DROP INDEX public."Category_title_key";
       public            dan    false    218            �           1259    16428    Dish_title_key    INDEX     K   CREATE UNIQUE INDEX "Dish_title_key" ON public."Dish" USING btree (title);
 $   DROP INDEX public."Dish_title_key";
       public            dan    false    216            �           1259    16430    User_login_key    INDEX     K   CREATE UNIQUE INDEX "User_login_key" ON public."User" USING btree (login);
 $   DROP INDEX public."User_login_key";
       public            dan    false    220            �           1259    16431    _CategoryToDish_AB_unique    INDEX     d   CREATE UNIQUE INDEX "_CategoryToDish_AB_unique" ON public."_CategoryToDish" USING btree ("A", "B");
 /   DROP INDEX public."_CategoryToDish_AB_unique";
       public            dan    false    221    221            �           1259    16432    _CategoryToDish_B_index    INDEX     V   CREATE INDEX "_CategoryToDish_B_index" ON public."_CategoryToDish" USING btree ("B");
 -   DROP INDEX public."_CategoryToDish_B_index";
       public            dan    false    221            �           2606    16433 &   _CategoryToDish _CategoryToDish_A_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."_CategoryToDish"
    ADD CONSTRAINT "_CategoryToDish_A_fkey" FOREIGN KEY ("A") REFERENCES public."Category"(id) ON UPDATE CASCADE ON DELETE CASCADE;
 T   ALTER TABLE ONLY public."_CategoryToDish" DROP CONSTRAINT "_CategoryToDish_A_fkey";
       public          dan    false    218    3205    221            �           2606    16438 &   _CategoryToDish _CategoryToDish_B_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."_CategoryToDish"
    ADD CONSTRAINT "_CategoryToDish_B_fkey" FOREIGN KEY ("B") REFERENCES public."Dish"(id) ON UPDATE CASCADE ON DELETE CASCADE;
 T   ALTER TABLE ONLY public."_CategoryToDish" DROP CONSTRAINT "_CategoryToDish_B_fkey";
       public          dan    false    3202    221    216                \   x���	�@��b�X���`&F����!�0ۑ<����e3�Vm��H![�!k+D[;a#q��E�^�6y���vW�o��_C��?�6B           x�UP�J�P]O�"_Pz��/� �w�6�b�,ju!���ܦ�h���/��#�$N���3�5�Z4��5
9%����4�Nslb�t����<�//�"
�h5�{I\��:��`�s׌O��4
J�Q�"�T�crp��`f�-�V���}&�wT�I8=�-���i7�8*xe�]֨Pw[����t�1�ԥ�~��L�!t�Z�!x���v�e�
� |�'�͑��
ͱ㼟W���nl��ݧ�cv7�wf��'�j.#�:DQ�i��      "   R   x�3�LL����T1JR10Qq��4��2	*�p�*�+
7u��	J	-�)t�.IO3H����,u��wv�0.6������ 6��      #   8   x�%��� ���0��(��t�9H�#�d�*�I�ad��_�z����1=�+n�5`�v�         �   x�m��� Ϧ��#��?`]D*���/!qΑ�6�q��=��9k�+���^ڤb��v��*ˀ�1��I�"�R�m��j<��o.C
�A�6K�eЃ��߽�	?�����꛶�u�/*^D�(�{J��&+�     