/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_is_wp.c                                         :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: tjose <marvin@42.fr>                       +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2016/11/28 17:33:47 by tjose             #+#    #+#             */
/*   Updated: 2016/11/28 21:08:47 by tjose            ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

int		ft_is_wp(char c)
{
	if (c == ' ' || c == '\f' || c == '\n' || c == '\t'
			|| c == '\r' || c == '\v')
		return (1);
	return (0);
}
