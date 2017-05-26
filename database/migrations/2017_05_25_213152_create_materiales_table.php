<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateMaterialesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('materiales', function (Blueprint $table) {
            $table->increments('id');
            $table->string('nombre');
            $table->integer('cantidad');

            $table->integer('id_recoleccion')->unsigned();
            $table->foreign('id_recoleccion')->references('id')->on('recolecciones')->onDelete('cascade');

            $table->integer('id_apoyo')->unsigned();
            $table->foreign('id_apoyo')->references('id')->on('apoyos_economicos')->onDelete('cascade');

            $table->integer('id_evento')->unsigned();
            $table->foreign('id_evento')->references('id')->on('eventos')->onDelete('cascade');

            $table->integer('id_voluntariado')->unsigned();
            $table->foreign('id_voluntariado')->references('id')->on('voluntariados')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('materiales');
    }
}