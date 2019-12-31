#!/bin/sh
# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    getbackupsize.sh                                   :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: macbook <macbook@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2017/12/30 16:38:50 by macbook           #+#    #+#              #
#    Updated: 2017/12/30 16:38:50 by macbook          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #


# This script calculates the size of each "backup." folder.
# The size of the first (oldest) folder is calculated completely.
# the following folders are calculated without included hardlinks.
# This way you get the difference in size of each backup to the previous one

du $1 --block-size=1M --max-depth=1 |sort -nr

exit 0
