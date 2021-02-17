
switch (type)
{
	case 0:
		switch (subtype)
		{
			case 1:
				gems += 4
			case 0:
				gems += 1
				create_particle(x,y,0)
				break
			case 2:
				if health < 3
					health += 1
				create_particle(x,y,1)
				break
		}
		break
}
