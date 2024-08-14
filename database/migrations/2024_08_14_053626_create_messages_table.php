<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('messages', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('conversation_id'); // Foreign key to conversations table
            $table->enum('sender', ['user', 'assistant']); // Indicates whether the sender is the user or the assistant
            $table->text('message_text'); // The actual message text
            $table->timestamp('timestamp'); // The time the message was sent
            $table->timestamps();

            // Foreign key constraint
            $table->foreign('conversation_id')->references('id')->on('conversations')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('messages');
    }
};
