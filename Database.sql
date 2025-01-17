PGDMP         .                y            postgres    11.7 (Debian 11.7-1.pgdg100+1)    11.7 (Debian 11.7-1.pgdg100+1) 0    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false            �           1262    13101    postgres    DATABASE     z   CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.UTF-8' LC_CTYPE = 'en_US.UTF-8';
    DROP DATABASE postgres;
             postgres    false            �           0    0    DATABASE postgres    COMMENT     N   COMMENT ON DATABASE postgres IS 'default administrative connection database';
                  postgres    false    2965            �            1259    17895    healthcare_professional    TABLE     �   CREATE TABLE public.healthcare_professional (
    "MC_id" integer NOT NULL,
    id integer NOT NULL,
    name character varying(30) NOT NULL,
    surname character varying(30) NOT NULL
);
 +   DROP TABLE public.healthcare_professional;
       public         postgres    false            �            1259    17893    healthcare_professional_id_seq    SEQUENCE     �   CREATE SEQUENCE public.healthcare_professional_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.healthcare_professional_id_seq;
       public       postgres    false    203            �           0    0    healthcare_professional_id_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.healthcare_professional_id_seq OWNED BY public.healthcare_professional.id;
            public       postgres    false    202            �            1259    17869    hes    TABLE     �   CREATE TABLE public.hes (
    hes_code integer NOT NULL,
    phone_number numeric NOT NULL,
    state_of_health text NOT NULL,
    vaccination_info text NOT NULL
);
    DROP TABLE public.hes;
       public         postgres    false            �            1259    17884    medical_center    TABLE     �   CREATE TABLE public.medical_center (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    city character varying(30) NOT NULL,
    district character varying(30) NOT NULL,
    full_address text NOT NULL
);
 "   DROP TABLE public.medical_center;
       public         postgres    false            �            1259    17882    medical_center_id_seq    SEQUENCE     �   CREATE SEQUENCE public.medical_center_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.medical_center_id_seq;
       public       postgres    false    201            �           0    0    medical_center_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.medical_center_id_seq OWNED BY public.medical_center.id;
            public       postgres    false    200            �            1259    17857    person    TABLE     E  CREATE TABLE public.person (
    id integer NOT NULL,
    name character varying(20) NOT NULL,
    surname character varying(20) NOT NULL,
    gender character varying(10) NOT NULL,
    age integer NOT NULL,
    hes_code integer NOT NULL,
    city text NOT NULL,
    district text NOT NULL,
    full_address text NOT NULL
);
    DROP TABLE public.person;
       public         postgres    false            �            1259    17855    person_hes_code_seq    SEQUENCE     �   CREATE SEQUENCE public.person_hes_code_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.person_hes_code_seq;
       public       postgres    false    198            �           0    0    person_hes_code_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.person_hes_code_seq OWNED BY public.person.hes_code;
            public       postgres    false    197            �            1259    17853    person_id_seq    SEQUENCE     �   CREATE SEQUENCE public.person_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.person_id_seq;
       public       postgres    false    198            �           0    0    person_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.person_id_seq OWNED BY public.person.id;
            public       postgres    false    196            �            1259    17914    vaccination    TABLE     �   CREATE TABLE public.vaccination (
    vc_id integer NOT NULL,
    hp_id integer NOT NULL,
    person_id integer NOT NULL,
    date date NOT NULL
);
    DROP TABLE public.vaccination;
       public         postgres    false            �            1259    17908    vaccine    TABLE     �   CREATE TABLE public.vaccine (
    id integer NOT NULL,
    type character varying(30) NOT NULL,
    country character varying(30) NOT NULL
);
    DROP TABLE public.vaccine;
       public         postgres    false            �            1259    17906    vaccine_id_seq    SEQUENCE     �   CREATE SEQUENCE public.vaccine_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.vaccine_id_seq;
       public       postgres    false    205            �           0    0    vaccine_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.vaccine_id_seq OWNED BY public.vaccine.id;
            public       postgres    false    204            �
           2604    17898    healthcare_professional id    DEFAULT     �   ALTER TABLE ONLY public.healthcare_professional ALTER COLUMN id SET DEFAULT nextval('public.healthcare_professional_id_seq'::regclass);
 I   ALTER TABLE public.healthcare_professional ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    203    202    203            �
           2604    17887    medical_center id    DEFAULT     v   ALTER TABLE ONLY public.medical_center ALTER COLUMN id SET DEFAULT nextval('public.medical_center_id_seq'::regclass);
 @   ALTER TABLE public.medical_center ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    200    201    201            �
           2604    17860 	   person id    DEFAULT     f   ALTER TABLE ONLY public.person ALTER COLUMN id SET DEFAULT nextval('public.person_id_seq'::regclass);
 8   ALTER TABLE public.person ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    198    196    198            �
           2604    17861    person hes_code    DEFAULT     r   ALTER TABLE ONLY public.person ALTER COLUMN hes_code SET DEFAULT nextval('public.person_hes_code_seq'::regclass);
 >   ALTER TABLE public.person ALTER COLUMN hes_code DROP DEFAULT;
       public       postgres    false    197    198    198            �
           2604    17911 
   vaccine id    DEFAULT     h   ALTER TABLE ONLY public.vaccine ALTER COLUMN id SET DEFAULT nextval('public.vaccine_id_seq'::regclass);
 9   ALTER TABLE public.vaccine ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    205    204    205            �          0    17895    healthcare_professional 
   TABLE DATA               M   COPY public.healthcare_professional ("MC_id", id, name, surname) FROM stdin;
    public       postgres    false    203   �5       �          0    17869    hes 
   TABLE DATA               X   COPY public.hes (hes_code, phone_number, state_of_health, vaccination_info) FROM stdin;
    public       postgres    false    199   (6       �          0    17884    medical_center 
   TABLE DATA               P   COPY public.medical_center (id, name, city, district, full_address) FROM stdin;
    public       postgres    false    201   �6       �          0    17857    person 
   TABLE DATA               h   COPY public.person (id, name, surname, gender, age, hes_code, city, district, full_address) FROM stdin;
    public       postgres    false    198   �7       �          0    17914    vaccination 
   TABLE DATA               D   COPY public.vaccination (vc_id, hp_id, person_id, date) FROM stdin;
    public       postgres    false    206   K9       �          0    17908    vaccine 
   TABLE DATA               4   COPY public.vaccine (id, type, country) FROM stdin;
    public       postgres    false    205   �9       �           0    0    healthcare_professional_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.healthcare_professional_id_seq', 8, true);
            public       postgres    false    202            �           0    0    medical_center_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.medical_center_id_seq', 8, true);
            public       postgres    false    200            �           0    0    person_hes_code_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.person_hes_code_seq', 11, true);
            public       postgres    false    197            �           0    0    person_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.person_id_seq', 11, true);
            public       postgres    false    196            �           0    0    vaccine_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.vaccine_id_seq', 2, true);
            public       postgres    false    204            �
           2606    17866    person pk_id 
   CONSTRAINT     J   ALTER TABLE ONLY public.person
    ADD CONSTRAINT pk_id PRIMARY KEY (id);
 6   ALTER TABLE ONLY public.person DROP CONSTRAINT pk_id;
       public         postgres    false    198                       2606    17892    medical_center pk_md_id 
   CONSTRAINT     U   ALTER TABLE ONLY public.medical_center
    ADD CONSTRAINT pk_md_id PRIMARY KEY (id);
 A   ALTER TABLE ONLY public.medical_center DROP CONSTRAINT pk_md_id;
       public         postgres    false    201                       2606    17913    vaccine pk_vc_id 
   CONSTRAINT     N   ALTER TABLE ONLY public.vaccine
    ADD CONSTRAINT pk_vc_id PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.vaccine DROP CONSTRAINT pk_vc_id;
       public         postgres    false    205            �
           2606    17868    person un_hescode 
   CONSTRAINT     P   ALTER TABLE ONLY public.person
    ADD CONSTRAINT un_hescode UNIQUE (hes_code);
 ;   ALTER TABLE ONLY public.person DROP CONSTRAINT un_hescode;
       public         postgres    false    198                       2606    17900     healthcare_professional un_hp_id 
   CONSTRAINT     Y   ALTER TABLE ONLY public.healthcare_professional
    ADD CONSTRAINT un_hp_id UNIQUE (id);
 J   ALTER TABLE ONLY public.healthcare_professional DROP CONSTRAINT un_hp_id;
       public         postgres    false    203                        2606    17876    hes un_phone_number 
   CONSTRAINT     V   ALTER TABLE ONLY public.hes
    ADD CONSTRAINT un_phone_number UNIQUE (phone_number);
 =   ALTER TABLE ONLY public.hes DROP CONSTRAINT un_phone_number;
       public         postgres    false    199                       2606    17901     healthcare_professional fk_MC_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.healthcare_professional
    ADD CONSTRAINT "fk_MC_id" FOREIGN KEY ("MC_id") REFERENCES public.medical_center(id) ON UPDATE CASCADE ON DELETE CASCADE;
 L   ALTER TABLE ONLY public.healthcare_professional DROP CONSTRAINT "fk_MC_id";
       public       postgres    false    203    201    2818                       2606    17877    hes fk_hes_code    FK CONSTRAINT     �   ALTER TABLE ONLY public.hes
    ADD CONSTRAINT fk_hes_code FOREIGN KEY (hes_code) REFERENCES public.person(hes_code) ON UPDATE CASCADE ON DELETE CASCADE;
 9   ALTER TABLE ONLY public.hes DROP CONSTRAINT fk_hes_code;
       public       postgres    false    2814    199    198            
           2606    17922    vaccination fk_hp_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.vaccination
    ADD CONSTRAINT fk_hp_id FOREIGN KEY (hp_id) REFERENCES public.healthcare_professional(id) ON UPDATE CASCADE ON DELETE CASCADE;
 >   ALTER TABLE ONLY public.vaccination DROP CONSTRAINT fk_hp_id;
       public       postgres    false    2820    206    203                       2606    17927    vaccination fk_pr_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.vaccination
    ADD CONSTRAINT fk_pr_id FOREIGN KEY (person_id) REFERENCES public.person(id) ON UPDATE CASCADE ON DELETE CASCADE;
 >   ALTER TABLE ONLY public.vaccination DROP CONSTRAINT fk_pr_id;
       public       postgres    false    2812    206    198            	           2606    17917    vaccination fk_vc_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.vaccination
    ADD CONSTRAINT fk_vc_id FOREIGN KEY (vc_id) REFERENCES public.vaccine(id) ON UPDATE CASCADE ON DELETE CASCADE;
 >   ALTER TABLE ONLY public.vaccination DROP CONSTRAINT fk_vc_id;
       public       postgres    false    205    2822    206            �   e   x�Uɹ	�@E���b��M���`d��,��>?��c`Д9�x�<#-,ʶ������y\�wtp�V���t
��W�����$F֨��Ķ"��J�      �   �   x�m�K
�0D��]Z���tRB!���}��i�fF��I��v}�cy��4/�=��*�K�h_��\��3.k�{��2�EICj�
X�q�He�����@X���L�1�c�JFlԩ�XT�������Q�Mc���j      �   �   x�m�=N1��S�X���(T4��B�u��Vڽ ǠL��*�ýX�_������yzc_²ްsUj�ł�'�w�A��������p!�Ϋ��l(^�3[��D�7 S��mp�w��i8zb�ށ�9�?�(�`�-̋<����ū�RYǾ��mٓ�I:F![�w039Y:��8���������s��;�&�-��!�I5����0[��jL�WȃM��
�����Vq�3      �   j  x�uP�N�@�羂 �Nl'����"B��f�^���gD��e��t6��a;6�������ظ*Rʰ�)+��H�#ظ�����#5�j�����R����ݮk�C�Q��|�=�̫�z��3�)��{�'�̍�q�Je����lf��1�%Ei�q[f��S�8����E��QP$FѪ�'���uB]��(4eeb���i�a����Wًuf�d1)�]RM�������χo���h�i��FL�SҊ߰�0��P\L������K���AVÈ�I�\�9�m�n�8�"��BR�#\��̴G���1�y4�mMx����mcYh�`�]sD����0L/��4Gmߟ!~ �~��      �   F   x�]���0Cѳ�KQ�6���s�^hA��''3oV-���^��XP���Jmǩ~/�
n���2q<      �   0   x�3����/KL�t���K�2�t���+IM��tO-�M̫����� v�     