# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: harmida <harmida@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/09/20 23:19:44 by harmida           #+#    #+#              #
#    Updated: 2020/09/20 23:19:45 by harmida          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #


NAME		= cub3D
CC			= gcc
CFLAGS		= -Wall -Wextra -Werror
SRC			= main.c \
			  parser/ft_check_args.c \
			  parser/ft_chek_map.c \
			  parser/parser.c \
			  parser/ft_take_param.c \
			  parser/ft_take_param_2.c \
			  parser/ft_make_array.c \
			  base/ft_base.c




OBJ			= $(SRC:.c=.o)
HEAD		= cub3d.h
HEAD_PATH	= -I mlx_linux/ -I libft/
LIBFT		= libft/libft.a
MLX			= mlx_linux/libmlx.a

all	: $(NAME)

%.o: %.c
#	$(CC) -I/usr/include -Imlx_linux -O3 -c $< -o $@
	$(CC) -Wall -Wextra -Werror -I/usr/include -Imlx_linux -O3 -c $< -o $@

$(NAME): $(OBJ) $(HEAD) $(LIBFT) $(MLX)
	$(CC) -o $(NAME) $(OBJ) $(HEAD_PATH) -Lmlx_linux -lmlx -Llibft -lft -L/usr/lib -lXext -lX11 -lm -lz

$(LIBFT): NONE
	@echo '----------- libft ----------'
	@make -C ./libft --no-print-directory

$(MLX): NONE
	@echo '----------- mlx ----------'
	@make		-C ./mlx_linux --no-print-directory

clean:
	rm -f $(OBJ)

fclean:	clean
	rm -f $(NAME)
	rm -f screenshot*.bmp

re: fclean all

fcleanall: fclean
	@make fclean -C ./libft --no-print-directory

.PHONY: NONE re fclean clean all fcleanall


