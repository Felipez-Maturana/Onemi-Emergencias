<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateDonacionesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('donaciones', function (Blueprint $table) {
            $table->increments('id');
            $table->date('fecha');
            $table->time('hora');
            $table->integer('monto');

            $table->integer('id_persona')->unsigned();
            $table->foreign('id_persona')->references('id')->on('personas')->onDelete('cascade');

            $table->integer('id_cuenta_banco')->unsigned();
            $table->foreign('id_cuenta_banco')->references('id')->on('cuentas_banco')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('donaciones');
    }
}
