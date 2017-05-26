<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateApoyosEconomicosTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('apoyos_economicos', function (Blueprint $table) {
            $table->increments('id');

            $table->string('nombre_medida');
            $table->date('fecha_inicio');
            $table->date('fecha_termino');
            $table->decimal('avance');
            $table->integer('meta');
            $table->integer('recaudacion_actual');

            $table->integer('id_cuenta_banco')->unsigned();
            $table->foreign('id_cuenta_banco')->references('id')->on('cuentas_banco')->onDelete('cascade');

            $table->integer('id_catastrofe')->unsigned();
            $table->foreign('id_catastrofe')->references('id')->on('catastrofes')->onDelete('cascade');

            $table->integer('id_usuario')->unsigned();
            $table->foreign('id_usuario')->references('id')->on('usuarios')->onDelete('cascade');

            $table->integer('id_muro')->unsigned();
            $table->foreign('id_muro')->references('id')->on('muros')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('apoyos_economicos');
    }
}

