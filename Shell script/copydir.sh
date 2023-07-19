#!/bin/bash
# copydir.sh - Copia o diret�rio mostrando uma barra de progresso
# Este script faz parte do http://aurelio.net/shell/dialog
#
# Uso:  copydir.sh  <dir-origem>  <dir-destino>
#
# Exemplo de uso da caixa de barra de progresso (gauge), que �
# diferente e meio complicada de usar. Ela espera receber a
# porcentagem da barra via STDIN, sendo um n�mero de 0 a 100.
#
# O Gauge s� mostra na tela a porcentagem que voc� informar,
# ele n�o tem intelig�ncia, ent�o todo o controle sobre o
# processo deve ser feito manualmente pelo programador.
#
# O procedimento se resume em duas a��es:
#
#   1) Saber como quantificar o TOTAL, para conhecer o 100%.
#      No caso de uma c�pia de arquivos, o TOTAL � o tamanho
#      total de todos os arquivos a serem copiados.
#
#   2) Saber como descobrir de tempos em tempos o STATUS
#      corrente do procedimento, enquanto ele est� sendo
#      executado, para poder calcular o quanto ainda falta
#      para o final (100%). No caso de uma c�pia de arquivos,
#      o STATUS � a quantidade de arquivos que j� foi copiada,
#      ou o espa�o em disco ocupado por eles.
#
# Tendo os dois dados n�o, uma simples regrinha de tr�s lhe d�
# a porcentagem atual do andamento: STATUS*100/TOTAL.
#
# 12 Agosto 2004 - Aur�lio Marinho Jargas

#................................................................

TITLE='Copiando...'
MSG='Copiando o diret�rio $ORIGEM para $DESTINO'
INTERVALO=1       # intervalo de atualiza��o da barra (segundos)
PORCENTO=0        # porcentagem inicial da barra

#................................................................

ORIGEM="${1%/}"
DESTINO="${2%/}"

die()    { echo "Erro: $*" ; exit 1 ; }
sizeof() { du -s "$1" | cut -f1; }
running(){ ps $1 | grep $1 >/dev/null; }

#................................................................

# tem somente dois par�metros?
[ "$2" ] || die "Uso: $0 dir-origem dir-destino"

# a origem e o destino devem ser diret�rios
[ -d "$ORIGEM"  ] || die "A origem '$ORIGEM' deve ser um diret�rio"
[ -d "$DESTINO" ] || die "O destino '$DESTINO' deve ser um diret�rio"

# mesmo dir?
[ "$ORIGEM" = "$DESTINO" ] &&
	die "A origem e o destino s�o o mesmo diret�rio"

# o diret�rio de destino est� vazio?
DIR_DESTINO="$DESTINO/${ORIGEM##*/}"
[ -d "$DIR_DESTINO" ] && [ $(sizeof $DIR_DESTINO) -gt 4 ] &&
	die "O dir de destino '$DIR_DESTINO' deveria estar vazio"

#................................................................

# expans�o das vari�veis da mensagem
MSG=$(eval echo $MSG)

# total a copiar (em bytes)
TOTAL=$(sizeof $ORIGEM)

# in�cio da c�pia, em segundo plano
cp -r $ORIGEM $DESTINO &
CPPID=$!

# caso o usu�rio cancele, interrompe a c�pia
trap "kill $CPPID" 2 15

#................................................................

# loop de checagem de status da c�pia
(
	# enquanto o processo de c�pia estiver rodando
	while running $CPPID; do
	
		# quanto j� foi copiado?
		COPIADO=$(sizeof $DIR_DESTINO)
		
		# qual a porcentagem do total?
		PORCENTAGEM=$((COPIADO*100/TOTAL))
		
		# envia a porcentagem para o dialog
		echo $PORCENTAGEM
		
		# aguarda at� a pr�xima checagem
		sleep $INTERVALO
	done	

	# c�pia finalizada, mostra a porcentagem final
	echo 100
	
) | dialog --title "$TITLE" --gauge "$MSG" 8 40 0

#................................................................

echo OK - Diret�rio copiado
