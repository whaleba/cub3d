

#include "../cub3d.h"
///// proverit 4tobi bil 1 igrok na karte

int ft_check_cell(t_param *prm, int j, int i)
{
	if (j == 0 || j == prm->str_n - 1)
		if(!(ft_strchr("1 ", prm->map_arr[j][i])))
			return (133); ///// карта не замкнута
	if ((j != prm->str_n - 1) && j != 0) ///// середина
	{
		if ((i == 0 || prm->map_arr[j][i + 1] == '\0') &&
			(!(ft_strchr("1 ", prm->map_arr[j][i]))))
			return (133); ///// карта не замкнута
		if ((i != 0 && prm->map_arr[j][i + 1] != '\0') &&
		(ft_strchr("NSWE", prm->map_arr[j][i])))
		{
			printf("i = %2d --- %c\n", i, prm->player);
			if (prm->player == '0') {
				prm->player = prm->map_arr[j][i];
				prm->play_x = i;
				prm->play_y = j;
			} else
				return (134); ////// больше 1 игрока на карте
		}
	}
		return (0);
}

int ft_check_map(t_param *prm)
{ ////// (char **array, int height_array)
	int     j;
	int     i;

	j = 0;
	while (j <= prm->str_n - 1)
	{
		i = 0;
		while (prm->map_arr[j][i] != '\0')
		{
			if (!(ft_strchr("012 NSWE", prm->map_arr[j][i])))
				return (132); //// недопутстимые символы в карте
			if (!(ft_strchr("1 ", prm->map_arr[j][i])) &&
			(prm->map_arr[j][i + 1] == ' ' ||
			((j != prm->str_n - 1) && prm->map_arr[j + 1][i] == ' ') ||
			(i != 0 && prm->map_arr[j][i - 1] == ' ') ||
			(j != 0 && prm->map_arr[j - 1][i] == ' ')))
				return (133); ///// карта не замкнута
			if ((prm->exit = ft_check_cell(prm, j, i)))
				return (prm->exit);
			i++;
		}
		j++;
	}
	return (prm->exit = (prm->player == '0') ? 135 : 0);
}