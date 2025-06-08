#using script_40e63dd222434655;
#using script_59ff79d681bb860c;
#using script_d74ae0b4aa21186;
#using scripts\engine\utility;
#using scripts\mp\bots\bots_gametype_br;
#using scripts\mp\gametypes\br_armory_kiosk;

#namespace namespace_21b0fdaf3b4a63b2;

// Namespace namespace_21b0fdaf3b4a63b2 / namespace_ca8eb8c7f624c164
// Params 1
// Checksum 0x0, Offset: 0xfd
// Size: 0x44
function createaction( target )
{
    return createactionbase( "Buy", target, "main", target.channel + "/" + target.itemname, &actionprocess, self, &function_f4caae7e8af9d32c );
}

// Namespace namespace_21b0fdaf3b4a63b2 / namespace_ca8eb8c7f624c164
// Params 1
// Checksum 0x0, Offset: 0x14a
// Size: 0x1e4
function actionprocess( bot )
{
    target = self.argument;
    
    if ( !isdefined( target ) )
    {
        return "Target is undefined";
    }
    
    targetpos = function_b454fb48a26aa2c7( target.buystation );
    bot setscriptgoal( targetpos, 32 );
    
    while ( true )
    {
        result = bot waittill_any_in_array_or_timeout( [ "goal", "bad_path" ], 15 );
        
        if ( result == "goal" )
        {
            bot setvelocity( ( 0, 0, 0 ) );
            waitframe();
            bot function_8b201bccc0aa3695( target.buystation.origin, 0.5 );
            bot botpressbutton( "use", 0.25 );
            
            /#
                function_f3cf203834e48c6d( "<dev string:x1c>" );
            #/
            
            wait 1.5;
            var_4f98c366c1ba6f75 = bot.plundercount;
            bot.armorykioskpurchaseallowed = 1;
            bot scripts\mp\gametypes\br_armory_kiosk::onarmorykioskpurchase( target.channel, target.purchaseindex );
            
            if ( bot.plundercount >= var_4f98c366c1ba6f75 )
            {
                function_6789bd08cbabdb47( target.buystation, bot );
            }
            
            var_be48ed4e05efe5cf = 45;
            var_60c1a9bc1584ef28 = 1.5;
            bot function_d1acad1ee42b2b2f( target.buystation, var_60c1a9bc1584ef28, var_be48ed4e05efe5cf );
            break;
        }
        
        if ( result == "bad_path" )
        {
            println( "<dev string:x24>" + self.decision.name + "<dev string:x3e>" + target.buystation.origin + "<dev string:x60>" + bot.origin );
            return result;
        }
    }
}

// Namespace namespace_21b0fdaf3b4a63b2 / namespace_ca8eb8c7f624c164
// Params 1
// Checksum 0x0, Offset: 0x336
// Size: 0x47
function function_b454fb48a26aa2c7( buystation )
{
    var_90a93951e4c15e03 = 48;
    pos = buystation.origin + anglestoforward( buystation.angles ) * var_90a93951e4c15e03;
    return getclosestpointonnavmesh( pos );
}

// Namespace namespace_21b0fdaf3b4a63b2 / namespace_ca8eb8c7f624c164
// Params 2
// Checksum 0x0, Offset: 0x386
// Size: 0x4c
function function_6789bd08cbabdb47( buystation, bot )
{
    if ( !isdefined( buystation.var_19c6f51451310013 ) )
    {
        buystation.var_19c6f51451310013 = [];
    }
    
    buystation.var_19c6f51451310013[ bot.entity_number ] = gettime();
}

// Namespace namespace_21b0fdaf3b4a63b2 / namespace_ca8eb8c7f624c164
// Params 1
// Checksum 0x0, Offset: 0x3da
// Size: 0x1e
function function_f4caae7e8af9d32c( action )
{
    if ( function_d57dd414963503d1() )
    {
        self.armorykioskpurchaseallowed = undefined;
    }
}

