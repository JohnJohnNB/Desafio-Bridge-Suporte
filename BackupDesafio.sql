PGDMP     #    &                {            DesafioBridge    15.2    15.2 +    &           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            '           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            (           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            )           1262    16420    DesafioBridge    DATABASE     �   CREATE DATABASE "DesafioBridge" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Portuguese_Brazil.1252';
    DROP DATABASE "DesafioBridge";
                postgres    false            �            1259    16478 	   categoria    TABLE     e   CREATE TABLE public.categoria (
    id integer NOT NULL,
    nome character varying(255) NOT NULL
);
    DROP TABLE public.categoria;
       public         heap    postgres    false            �            1259    16477    categoria_id_seq    SEQUENCE     �   CREATE SEQUENCE public.categoria_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.categoria_id_seq;
       public          postgres    false    215            *           0    0    categoria_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.categoria_id_seq OWNED BY public.categoria.id;
          public          postgres    false    214            �            1259    16499    cliente    TABLE     c   CREATE TABLE public.cliente (
    id integer NOT NULL,
    nome character varying(255) NOT NULL
);
    DROP TABLE public.cliente;
       public         heap    postgres    false            �            1259    16498    cliente_id_seq    SEQUENCE     �   CREATE SEQUENCE public.cliente_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.cliente_id_seq;
       public          postgres    false    219            +           0    0    cliente_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.cliente_id_seq OWNED BY public.cliente.id;
          public          postgres    false    218            �            1259    16620    item_pedido    TABLE     �   CREATE TABLE public.item_pedido (
    id integer NOT NULL,
    produto_id integer NOT NULL,
    pedido_id integer NOT NULL,
    quantidade integer NOT NULL
);
    DROP TABLE public.item_pedido;
       public         heap    postgres    false            �            1259    16619    item_pedido_id_seq    SEQUENCE     �   CREATE SEQUENCE public.item_pedido_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.item_pedido_id_seq;
       public          postgres    false    223            ,           0    0    item_pedido_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.item_pedido_id_seq OWNED BY public.item_pedido.id;
          public          postgres    false    222            �            1259    16506    pedido    TABLE     �   CREATE TABLE public.pedido (
    id integer NOT NULL,
    data timestamp without time zone NOT NULL,
    endereco_entrega text NOT NULL,
    cliente_id integer NOT NULL
);
    DROP TABLE public.pedido;
       public         heap    postgres    false            �            1259    16505    pedido_id_seq    SEQUENCE     �   CREATE SEQUENCE public.pedido_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.pedido_id_seq;
       public          postgres    false    221            -           0    0    pedido_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.pedido_id_seq OWNED BY public.pedido.id;
          public          postgres    false    220            �            1259    16485    produto    TABLE     �   CREATE TABLE public.produto (
    id integer NOT NULL,
    nome character varying(255) NOT NULL,
    descricao character varying(255) NOT NULL,
    preco numeric(10,2) NOT NULL,
    categoria_id integer NOT NULL
);
    DROP TABLE public.produto;
       public         heap    postgres    false            �            1259    16484    produto_id_seq    SEQUENCE     �   CREATE SEQUENCE public.produto_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.produto_id_seq;
       public          postgres    false    217            .           0    0    produto_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.produto_id_seq OWNED BY public.produto.id;
          public          postgres    false    216            y           2604    16481    categoria id    DEFAULT     l   ALTER TABLE ONLY public.categoria ALTER COLUMN id SET DEFAULT nextval('public.categoria_id_seq'::regclass);
 ;   ALTER TABLE public.categoria ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    215    214    215            {           2604    16502 
   cliente id    DEFAULT     h   ALTER TABLE ONLY public.cliente ALTER COLUMN id SET DEFAULT nextval('public.cliente_id_seq'::regclass);
 9   ALTER TABLE public.cliente ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    218    219    219            }           2604    16623    item_pedido id    DEFAULT     p   ALTER TABLE ONLY public.item_pedido ALTER COLUMN id SET DEFAULT nextval('public.item_pedido_id_seq'::regclass);
 =   ALTER TABLE public.item_pedido ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    222    223    223            |           2604    16509 	   pedido id    DEFAULT     f   ALTER TABLE ONLY public.pedido ALTER COLUMN id SET DEFAULT nextval('public.pedido_id_seq'::regclass);
 8   ALTER TABLE public.pedido ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    221    220    221            z           2604    16488 
   produto id    DEFAULT     h   ALTER TABLE ONLY public.produto ALTER COLUMN id SET DEFAULT nextval('public.produto_id_seq'::regclass);
 9   ALTER TABLE public.produto ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    216    217    217                      0    16478 	   categoria 
   TABLE DATA           -   COPY public.categoria (id, nome) FROM stdin;
    public          postgres    false    215   {.                 0    16499    cliente 
   TABLE DATA           +   COPY public.cliente (id, nome) FROM stdin;
    public          postgres    false    219   �.       #          0    16620    item_pedido 
   TABLE DATA           L   COPY public.item_pedido (id, produto_id, pedido_id, quantidade) FROM stdin;
    public          postgres    false    223   �/       !          0    16506    pedido 
   TABLE DATA           H   COPY public.pedido (id, data, endereco_entrega, cliente_id) FROM stdin;
    public          postgres    false    221   �1                 0    16485    produto 
   TABLE DATA           K   COPY public.produto (id, nome, descricao, preco, categoria_id) FROM stdin;
    public          postgres    false    217   5       /           0    0    categoria_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.categoria_id_seq', 3, true);
          public          postgres    false    214            0           0    0    cliente_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.cliente_id_seq', 50, true);
          public          postgres    false    218            1           0    0    item_pedido_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.item_pedido_id_seq', 100, true);
          public          postgres    false    222            2           0    0    pedido_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.pedido_id_seq', 100, true);
          public          postgres    false    220            3           0    0    produto_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.produto_id_seq', 50, true);
          public          postgres    false    216                       2606    16483    categoria categoria_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.categoria
    ADD CONSTRAINT categoria_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.categoria DROP CONSTRAINT categoria_pkey;
       public            postgres    false    215            �           2606    16504    cliente cliente_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cliente_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.cliente DROP CONSTRAINT cliente_pkey;
       public            postgres    false    219            �           2606    16625    item_pedido item_pedido_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.item_pedido
    ADD CONSTRAINT item_pedido_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.item_pedido DROP CONSTRAINT item_pedido_pkey;
       public            postgres    false    223            �           2606    16513    pedido pedido_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.pedido
    ADD CONSTRAINT pedido_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.pedido DROP CONSTRAINT pedido_pkey;
       public            postgres    false    221            �           2606    16492    produto produto_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.produto
    ADD CONSTRAINT produto_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.produto DROP CONSTRAINT produto_pkey;
       public            postgres    false    217            �           2606    16631 &   item_pedido item_pedido_pedido_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.item_pedido
    ADD CONSTRAINT item_pedido_pedido_id_fkey FOREIGN KEY (pedido_id) REFERENCES public.pedido(id);
 P   ALTER TABLE ONLY public.item_pedido DROP CONSTRAINT item_pedido_pedido_id_fkey;
       public          postgres    false    3205    221    223            �           2606    16626 '   item_pedido item_pedido_produto_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.item_pedido
    ADD CONSTRAINT item_pedido_produto_id_fkey FOREIGN KEY (produto_id) REFERENCES public.produto(id);
 Q   ALTER TABLE ONLY public.item_pedido DROP CONSTRAINT item_pedido_produto_id_fkey;
       public          postgres    false    3201    223    217            �           2606    16514    pedido pedido_cliente_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.pedido
    ADD CONSTRAINT pedido_cliente_id_fkey FOREIGN KEY (cliente_id) REFERENCES public.cliente(id);
 G   ALTER TABLE ONLY public.pedido DROP CONSTRAINT pedido_cliente_id_fkey;
       public          postgres    false    3203    219    221            �           2606    16493 !   produto produto_categoria_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.produto
    ADD CONSTRAINT produto_categoria_id_fkey FOREIGN KEY (categoria_id) REFERENCES public.categoria(id);
 K   ALTER TABLE ONLY public.produto DROP CONSTRAINT produto_categoria_id_fkey;
       public          postgres    false    217    215    3199               #   x�3�tN,IM�/�L4�2Bp���c�=... /0�         �   x�E�1n�0C�:�0�9C�r�k��b� U�Q������~���D�Y����4c���sr�y��\\{^�H�@�A(IJT���Q�(iM��N��
@ATu���tQTS��jPԤ"����A]t}����~��ᛎ�MGЃ��'A�t������X8����?�o���G�G��#�ň`|����[      #   �  x�%�Q�!C��0[���]������*�(pYز���x�m����XxX4��i;��_�c����bAʳg���2�|}D|-�����!�ul�<���eX��ĖH8�TjBK�o
<-�M��tY�}��ײE��f� 	�ׄ�剎����]�����Ժx���o̿�eag��� �9[9�~rBSY�H��I��y�=�rZZ��J���N�5�	�-&���R!���ݤ	!]K:�y).�.�# �ms��S��ҵ��ܺN�,�\ Y�z�3)]����&�<K] �}�+�D��'1W6�%`����=3@�����ǛrF���xH�-��5ݿ2��c ���lik�;0��j��Ց� �2	,��	��uՊ[�m%e��!Ȳ�Ɍ��$�I٣]��9�?���b�Mp��R ��4Q����d�?1y�f���?񃼼�X�|4R�5�}$���{:֚�N�
��阵���g��7�L�w�\�oF]���w��ј�      !   m  x���ˍ1D�b�@/D����Y�b`����sr N̥��8�� �&��Rk*��#�#��ڻ�w�oV�jM�>?�_��~�>������7M�Jy`�P[��L��,YTkG!�y�.uav�r簚Ԥ=0=�q��$���elJ��F�,3�9l&���QΏ��q�dCTw/�HP�5�P
]�$����t�;> �^_�EE�>�Vl�ћɰM��1��jXkm���5�p���ǘI��2�]���q)%Gu!]���N��R�Q�%~"R�tS�L���؊�t߾?��� �m,c�=Ʊ���]1�ν�I�1��@�T+Q��b���z*w1�bo5OC�����&7TfO
��Slo�9�q�†5s=Ź
z'oS +*�v�Bn?3�MeA�F��n�]�.��7,�k����q�ԍ�]��Qm]��wS��u�y���@ �}����˸��4��4�sdA]����H~#H��r�o�V�q�[D�Ժ�����j�{��?�5�P��{RT���Ao�8�2��B7�o �n��dLc!��v��`��햲�����D��zy5���m����@6h�3w��d��"������1���=𣏕M8@�� Ҥ_�@VA�=��d���Q�;���G=���b�
�z$c<N��j!��^*6�A��b���e��� �i���n����p@`�%␊�EF�#�
��ݰ��=ܘL8�|���a{�i2�Ȇx ��|
g�w"25�A^@ ���pHo��0�?Łؔ����"2�e���f��`;���}T�-�aF�a�q ����AnԜ�:�y,Ƨ|�K��         /  x�u�;�1P��{�
�G?�p <k�N��A�bd�еV��
��T������_=>}��������?����ˏ�w�����{��~W�T=��P������~W;���Ml~��:Hu{��^�]��:�Y�s��E��&c`�}W7��܀�COme�B˅-A�ڔL�����Д�!p�������3�]t��̝;A����!�K�f� �	"0��.Ce��d�	�2G6d_�TF� '8'hei�.���.Kc�V���> }�x�!����Ҙ%�9$���Ҙ%���f�,�Y"�׭B�,�Y"XS�Z�,�Y"0��vY�D�;��XY�Dط��,�Y"X�'���3K��#�.Kg������<�;����tf��L�/��ҙ%�����tf�`aV]'X��,�����ҙ%���xY:�DЇ�<�(�`���h��(�`��Uhie�A7ќQ��,x�o.��G�}��+^���f�`/=�e���<I�(�`�05�	e��h2�e�A����eg�֐���9��5��+     