function screen_shake(lenght, time)
{
    with(obj_view_camera)
    {
        shake_lenght = lenght;
        shake_time = time;
        alarm[0] = shake_time;
    }
}